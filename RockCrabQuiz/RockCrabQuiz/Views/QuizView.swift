//
//  QuizView.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import SwiftUI

import RswiftResources

struct QuizView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuizViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Group {
            if viewModel.showResult {
                VStack(spacing: 50) {
                    R.image.마니또.swiftImage
                        .resizable()
                        .scaledToFit()
                    
                    Text("총 22문제중에 \(viewModel.score)문제를 맞추셨습니다!")
                        .font(R.font.pretendardBold.swiftFontOfSize(20))
                    
                    Button("뒤로 가기") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundStyle(.white)
                    .background(Color.pink.opacity(0.8))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 22)
            } else {
                VStack(spacing: 10) {
                    Image(viewModel.currentQuestion.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .animation(.default, value: viewModel.currentQuestion.imageName)
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<4, id: \.self) { index in
                            Button {
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
                .font(R.font.pretendardRegular.swiftFontOfSize(18))
                .padding(.horizontal, 22)
            }
        }
        .navigationTitle("\(viewModel.currentQuestionIndex + 1) / 22번째 문제")
    }
}


#Preview {
    QuizView()
}
