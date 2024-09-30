//
//  QuizReducer.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct QuizReducer {
    @ObservableState
    struct State: Equatable {
        /// 현재 문제 인덱스
        var currentQuestionIndex: Int = 0
        /// 점수
        var score: Int = 0
        /// 선택된 답변 번호
        var selectedAnswer: Int? = nil
        /// 문제 리스트
        var questions: [Question] = []
        /// 결과를 보여줄지 여부
        var showResult: Bool = false
        
        struct Question: Equatable, Identifiable {
            let id = UUID()
            /// 이미지 파일명
            let imageName: String
            /// 정답 번호(1~4)
            let correctAnswer: Int
            /// 4지 선다형 정답지
            let options: [String]
        }
    }
    
    enum Action {
        /// 답변 선택
        case selectAnswerButtonTapped(Int)
        /// 다음 문제로 넘어가기
        case nextQuestionButtonTapped
        /// 결과 보기
        case showResultButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectAnswerButtonTapped(answer):
                state.selectedAnswer = answer
                if state.questions[state.currentQuestionIndex].correctAnswer == answer {
                    state.score += 1
                }
                return .none
                
            case .nextQuestionButtonTapped:
                return .none
                
            case .showResultButtonTapped:
                return .none
            }
        }
    }
}
