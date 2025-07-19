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
    /// 이미지 주소
    let imageURL: String
    /// 정답 번호
    let correctAnswer: Int
    /// 문제 보기
    let options: [String]
}

extension Question {
    /// 22문제
    static let questions: [Question] = [
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/강진하맥축제.jpg",
            correctAnswer: 1,
            options: ["강진하맥축제", "경기모아 뮤직 페스티벌", "스쿨어택", "해균교육사령부"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/건국대.jpeg",
            correctAnswer: 2,
            options: ["경북대", "건국대", "계명대", "영남대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/경기과학기술대.jpeg",
            correctAnswer: 3,
            options: ["구미대", "계명대", "경기과학기술대", "부산대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/경기모아뮤직페스티벌.jpeg",
            correctAnswer: 3,
            options: ["강진하맥축제", "카스쿨 페스티벌", "경기모아 뮤직 페스티벌", "서울팝콘"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/경북대.jpeg",
            correctAnswer: 1,
            options: ["경북대", "고려대", "구미대", "조선대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/계명대.jpeg",
            correctAnswer: 2,
            options: ["건국대", "계명대", "부산외대", "부산대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/고려대.jpeg",
            correctAnswer: 3,
            options: ["영남대", "연세대", "고려대", "서울대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/구미대.jpeg",
            correctAnswer: 4,
            options: ["세종대", "전남대", "부산대", "구미대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/남서울대.jpeg",
            correctAnswer: 1,
            options: ["남서울대", "강릉대", "계명대", "경기대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/대림대.jpeg",
            correctAnswer: 2,
            options: ["인천대", "대림대", "숭실대", "광명대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/부산대.jpeg",
            correctAnswer: 3,
            options: ["영남대", "경북대", "부산대", "부산외대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/부산외대.jpeg",
            correctAnswer: 4,
            options: ["대림대", "부산대", "인하대", "부산외대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/서울팝콘.jpeg",
            correctAnswer: 1,
            options: ["서울팝콘", "경기모아 뮤직 페스티벌", "발로란트", "펜타포트"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/섬의날.jpg",
            correctAnswer: 2,
            options: ["펜타포트", "섬의날", "서울팝콘", "경기모아 뮤직 페스티벌"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/스쿨어택.png",
            correctAnswer: 3,
            options: ["펜타포트", "경기모아 뮤직 페스티벌", "스쿨어택", "자라섬"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/악어의놀이터2.png",
            correctAnswer: 4,
            options: ["띵타이쿤", "멋봉리", "악어의 놀이터1", "악어의 놀이터2"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/영남대.jpeg",
            correctAnswer: 1,
            options: ["영남대", "경북대", "조선대", "부산대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/조선대.jpeg",
            correctAnswer: 2,
            options: ["부산외대", "조선대", "부산대", "세종대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/카스쿨페스티벌.jpeg",
            correctAnswer: 3,
            options: ["진로 페스티벌", "펩시 페스타", "카스쿨 페스티벌", "자라섬"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/펜타포트.jpeg",
            correctAnswer: 4,
            options: ["발로란트", "경기모아", "자라섬", "펜타포트"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/한양대에리카.jpeg",
            correctAnswer: 1,
            options: ["한양대에리카", "조선대", "부산대", "부산외대"]
        ),
        .init(
            imageURL: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/해군교육사령부.jpg",
            correctAnswer: 2,
            options: ["육군사관학교", "해군교육사령부", "51사단", "3사단"]
        )
    ]
}
