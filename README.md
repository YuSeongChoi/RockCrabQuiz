# 🎯 RockCrabQuiz

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform: iOS](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)]
[![Firebase Analytics](https://img.shields.io/badge/Analytics-Firebase-orange.svg)]

---

## 📖 소개

`RockCrabQuiz`는 **QWER** 팬(바위게)들을 위한 **팬메이드 아이템 맞추기 퀴즈 앱**입니다.
SwiftUI와 Firebase Analytics 기반으로 제작되었습니다.

---

## ✨ 주요 기능

- 문제 풀기 (4지선다) ✅  
- 이전/다음 내비게이션  
- Firebase 이벤트 기반 분석:  
  - `quiz_start`, `question_answered`, `question_navigated`, `quiz_finished`, `screenshot_saved`  
- 퀴즈 결과값 스크린샷 저장  
- TestFlight 통한 내부/외부 배포 준비중

---

## 📸 데모 스크린샷

## 📱 앱 화면 미리보기

<p align="center">
  <img src="RockCrabQuiz/media/main.png" alt="퀴즈 메인 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz.png" alt="퀴즈 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_back.png" alt="퀴즈 이전 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_next.png" alt="퀴즈 다음 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_rank.png" alt="퀴즈 랭킹 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_result.png" alt="퀴즈 결과 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_screenshot.png" alt="퀴즈 스샷 화면" width="250" height="auto"/>
  <img src="RockCrabQuiz/media/quiz_album.png" alt="퀴즈 앨범 화면" width="250" height="auto"/>
</p>

---

## 🚀 시작하기

1. 이 저장소 클론  
   ```bash
   git clone https://github.com/YuSeongChoi/RockCrabCalendar.git
   cd RockCrabCalendar
   ```
2.	RockTurtleQuiz.xcodeproj / .xcworkspace 열기
3.	Xcode에서 Signing & Capabilities → Team 설정
4.	기기 또는 시뮬레이터에서 실행
