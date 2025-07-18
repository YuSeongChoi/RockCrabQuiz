//
//  HomeView.swift
//  RockTurtleQuiz
//
//  Created by YuSeong on 9/17/24.
//

import SwiftUI
import FirebaseAnalytics
import RswiftResources

struct HomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("바위게 퀴즈 - 무대의상 맞추기")
                .pretendSemiBold(size: 22)
            
            AsyncRemoteImage(urlString: "https://raw.githubusercontent.com/YuSeongChoi/qwer-images/main/qwer/마니또.jpg")
            
            NavigationLink {
                QuizView()
                    .onAppear {
                        Analytics.logEvent("quiz_start", parameters: nil)
                    }
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .foregroundStyle(.pink.opacity(0.8))
                    .overlay(
                        Text("시작하기")
                            .pretendSemiBold(size: 18)
                            .foregroundStyle(.white)
                    )
            }
            
            Spacer()
            Text("※ 본 앱은 QWER과 무관한 팬 제작 콘텐츠입니다.\n상업적 목적이 없으며, 사진의 모든 저작권은 3Y Corporation과 프리즘필터 및 QWER에게 있습니다.")
                .pretendMid(size: 13)
                .foregroundStyle(Color(red: 111/255, green: 111/255, blue: 111/255))
                .multilineTextAlignment(.center)
        }
        .padding(EdgeInsets(top: 35, leading: 22, bottom: 35, trailing: 22))
    }
}
