//
//  QuizView.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import SwiftUI

import RswiftResources

struct QuizView: View {
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        Group {
            if viewModel.showResult {
                Text("최종 점수는 \(viewModel.score)점 입니다!!!")
                    .font(R.font.pretendardBold.swiftFontOfSize(24))
            } else {
                VStack(spacing: 20) {
                    Image(viewModel.currentQuestion.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding()
                    
                    ForEach(0..<4, id: \.self) { index in
                        Button {
                            viewModel.selectAnswer(index + 1)
                        } label: {
                            Text(viewModel.currentQuestion.options[index])
                                .padding()
                        }
                    }
                    
                    Button("다음") {
                        viewModel.nextQuestion()
                    }
                    .disabled(viewModel.selectedAnswer == nil)
                }
            }
        }
    }
}


#Preview {
    QuizView()
}
