//
//  QuizView.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import SwiftUI
import RswiftResources
import Firebase

struct QuizView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuizViewModel()
    @State private var savePhotoAlert: Bool = false
    // 랭킹 퍼센트
    @State private var rankingPercent: Int = 0
    // 랭킹 로딩 상태
    @State private var isCalculatingRank: Bool = true
    // 저장 메시지
    @State private var saveCompletionMessage: String? = ""
    // 이미지 로드
    @State private var isImageLoaded = false
    @State private var snapshotTargetView: UIView?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            if viewModel.showResult {
                if isCalculatingRank {
                    ProgressView("랭킹 계산 중...")
                } else {
                    CaptureView {
                        quizResultView
                    } onSnapshotReady: { view in
                        snapshotTargetView = view
                    }
                }
            } else {
                quizView
            }
        }
        .onChange(of: viewModel.showResult) {
            calculateRanking()
        }
        .navigationTitle("\(viewModel.currentQuestionIndex + 1) / 22번째 문제")
        .alert(saveCompletionMessage ?? "", isPresented: $savePhotoAlert) {
            Button("확인") {
                dismiss()
            }
        }
    }
    
    @ViewBuilder
    private var quizResultView: some View {
        VStack(spacing: 50) {
            AsyncRemoteImage(urlString: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/마니또.jpg") {
                isImageLoaded = true
            }
            
            VStack(spacing: 10) {
                Text("🎉 퀴즈 결과 🎉")
                Text("총 22문제중에 \(viewModel.score)문제를 맞추셨습니다!")
                if rankingPercent == 0 {
                    Text("🥇 상위 1% 이내입니다! 대단해요!")
                        .foregroundColor(.orange)
                } else {
                    Text("상위 \(rankingPercent)%입니다! 🎯")
                        .foregroundColor(rankingPercent <= 10 ? .green : .blue)
                }
            }
            .pretendBold(size: 20)
            
            HStack(spacing: 16) {
                Button("뒤로가기") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .foregroundStyle(.white)
                .background(Color.pink.opacity(0.8))
                .cornerRadius(10)
                
                Button("저장하기") {
                    guard let view = snapshotTargetView else { return }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
                        let img = renderer.image { ctx in
                            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
                        }
                        
                        ImageSaver.shared.writeToPhotoAlbum(image: img) { result in
                            switch result {
                            case .success:
                                saveCompletionMessage = "📷 저장 완료!"
                            case .failure(let err):
                                saveCompletionMessage = "저장 실패: \(err.localizedDescription)"
                            }
                            savePhotoAlert = true
                        }
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .foregroundStyle(.white)
                .background(Color.blue.opacity(0.8))
                .cornerRadius(10)
                .disabled(!isImageLoaded)
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 22)
    }
    
    @ViewBuilder
    private var quizView: some View {
        VStack(spacing: 10) {
            AsyncRemoteImage(urlString: viewModel.currentQuestion.imageURL) {
                isImageLoaded = true
            }
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<4, id: \.self) { index in
                    Button {
                        Analytics.logEvent("question_answered", parameters: [
                            "question_index": viewModel.currentQuestionIndex + 1,
                            "selected_answer": index + 1,
                            "is_correct": viewModel.currentQuestion.correctAnswer == index + 1
                        ])
                        viewModel.selectAnswer(index + 1)
                    } label: {
                        Text(viewModel.currentQuestion.options[index])
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .padding()
                            .background(viewModel.selectedAnswer == index + 1 ? Color.green : Color.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
            }
            
            Button {
                viewModel.nextQuestion()
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundStyle(.white)
                    .background(viewModel.selectedAnswer == nil ? Color.gray : Color.pink.opacity(0.8))
                    .cornerRadius(10)
            }
            .disabled(viewModel.selectedAnswer == nil)
        }
        .pretendReg(size: 18)
        .padding(.horizontal, 22)
    }
    
    private func calculateRanking() {
        let db = Firestore.firestore()
        let userScore = viewModel.score
        
        Analytics.logEvent("quiz_score_uploaded", parameters: [
            "score": userScore
        ])
        // 1. 점수 업로드
        db.collection("quizScores").addDocument(data: ["score": userScore]) { error in
            guard error == nil else {
                print("점수 업로드 에러! : \(error!.localizedDescription)")
                isCalculatingRank = false
                return
            }
            
            // 2. 전체 점수 가져오기
            db.collection("quizScores").getDocuments { snapshot, error in
                guard let documents = snapshot?.documents, error == nil else {
                    print("점수 가져오기 에러! : \(error!.localizedDescription)")
                    isCalculatingRank = false
                    return
                }
                let scores = documents.compactMap { $0.data()["score"] as? Int }
                
                // 3. 상위 퍼센트 계산
                let higherScores = scores.filter { $0 > userScore }.count
                let totalUsers = scores.count
                self.rankingPercent = Int((Double(higherScores) / Double(totalUsers)) * 100)
                Analytics.logEvent("quiz_finished", parameters: [
                    "score": userScore,
                    "ranking_percent": self.rankingPercent
                ])
                self.isCalculatingRank = false
            }
        }
    }
}
