//
//  QuizViewModel.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/20/24.
//

import Foundation

@MainActor
class QuizViewModel: Identifiable, ObservableObject {
    @Published var questions: [Question] = Question.questions.shuffled()
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var selectedAnswer: Int? = nil
    @Published var showResult: Bool = false
    @Published var selectedAnswers: [Int?] = Array(repeating: nil, count: Question.questions.count)
    
    var scores: Int {
        zip(questions, selectedAnswers).filter { q, a in
            a == q.correctAnswer
        }.count
    }
    
    /// 현재 문제
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    /// 답변 선택
    func selectAnswer(_ answer: Int) {
        selectedAnswer = answer
        selectedAnswers[currentQuestionIndex] = answer
        score = scores
    }
    
    /// 이전 문제로 돌아가기
    func previousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
            selectedAnswer = selectedAnswers[currentQuestionIndex]
        }
    }
    
    /// 다음 문제로 넘어가기
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswer = selectedAnswers[currentQuestionIndex]
        } else {
            showResult = true
        }
    }
}
