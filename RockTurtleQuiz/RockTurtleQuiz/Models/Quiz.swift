//
//  Quiz.swift
//  RockTurtleQuiz
//
//  Created by YuSeong on 9/17/24.
//

import Foundation

import RswiftResources

struct Quiz: Equatable {
    /// 현재 문제 인덱스
    var currentQuestionIndex: Int = 0
    /// 점수
    var score: Int = 0
    /// 선택된 답변 번호
    var selectedANswer: Int? = nil
    /// 문제 리스트
    var questions: [Question] = []
    /// 결과를 보여줄지 여부
    var showResult: Bool = false
}

struct Question: Equatable, Identifiable {
    let id = UUID()
    /// 이미지 이름
    let imageName: String
    /// 정답 번호
    let correctAnswer: Int
    /// 문제 보기
    let options: [String]
}

extension Question {
    /// 22문제
    static let questions: [Question] = [
        .init(imageName: R.image.강진하맥축제.name, correctAnswer: 1, options: ["강진하맥축제", "경기모아 뮤직 페스티벌", "스쿨어택", "해균교육사령부"]),
        .init(imageName: R.image.건국대.name, correctAnswer: 2, options: ["경북대", "건국대", "계명대", "영남대"]),
        .init(imageName: R.image.경기과학기술대.name, correctAnswer: 3, options: ["구미대", "계명대", "경기과학기술대", "부산대"]),
        .init(imageName: R.image.경기모아뮤직페스티벌.name, correctAnswer: 4, options: ["강진하맥축제", "카스쿨 페스티벌", "경기모아 뮤직 페스티벌", "서울팝콘"]),
        .init(imageName: R.image.경북대.name, correctAnswer: 1, options: ["경북대", "고려대", "구미대", "조선대"]),
        .init(imageName: R.image.계명대.name, correctAnswer: 2, options: ["건국대", "계명대", "부산외대", "부산대"]),
        .init(imageName: R.image.고려대.name, correctAnswer: 3, options: ["영남대", "연세대", "고려대", "서울대"]),
        .init(imageName: R.image.구미대.name, correctAnswer: 4, options: ["세종대", "전남대", "부산대", "구미대"]),
        .init(imageName: R.image.남서울대.name, correctAnswer: 1, options: ["남서울대", "강릉대", "계명대", "경기대"]),
        .init(imageName: R.image.대림대.name, correctAnswer: 2, options: ["인천대", "대림대", "숭실대", "광명대"]),
        .init(imageName: R.image.부산대.name, correctAnswer: 3, options: ["영남대", "경북대", "부산대", "부산외대"]),
        .init(imageName: R.image.부산외대.name, correctAnswer: 4, options: ["대림대", "부산대", "인하대", "부산외대"]),
        .init(imageName: R.image.서울팝콘.name, correctAnswer: 1, options: ["서울팝콘", "경기모아 뮤직 페스티벌", "발로란트", "펜타포트"]),
        .init(imageName: R.image.섬의날.name, correctAnswer: 2, options: ["펜타포트", "섬의날", "서울팝콘", "경기모아 뮤직 페스티벌"]),
        .init(imageName: R.image.스쿨어택.name, correctAnswer: 3, options: ["펜타포트", "경기모아 뮤직 페스티벌", "스쿨어택", "자라섬"]),
        .init(imageName: R.image.악어의놀이터2.name, correctAnswer: 4, options: ["띵타이쿤", "멋봉리", "악어의 놀이터1", "악어의 놀이터2"]),
        .init(imageName: R.image.영남대.name, correctAnswer: 1, options: ["영남대", "경북대", "조선대", "부산대"]),
        .init(imageName: R.image.조선대.name, correctAnswer: 2, options: ["부산외대", "조선대", "부산대", "세종대"]),
        .init(imageName: R.image.카스쿨페스티벌.name, correctAnswer: 3, options: ["진로 페스티벌", "펩시 페스타", "카스쿨 페스티벌", "자라섬"]),
        .init(imageName: R.image.펜타포트.name, correctAnswer: 4, options: ["발로란트", "경기모아", "자라섬", "펜타포트"]),
        .init(imageName: R.image.한양대에리카.name, correctAnswer: 1, options: ["한양대에리카", "조선대", "부산대", "부산외대"]),
        .init(imageName: R.image.해군교육사령부.name, correctAnswer: 2, options: ["육군사관학교", "해군교육사령부", "51사단", "3사단"])
    ]
}
