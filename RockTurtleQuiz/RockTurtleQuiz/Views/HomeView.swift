//
//  HomeView.swift
//  RockTurtleQuiz
//
//  Created by YuSeong on 9/17/24.
//

import SwiftUI

import RswiftResources

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("바위게 퀴즈 - 무대의상 맞추기")
                .font(R.font.pretendardSemiBold.swiftFontOfSize(22))
            
            VStack(spacing: 30) {
                R.image.마니또.swiftImage
                    .resizable()
                    .scaledToFit()
                
                NavigationLink {
                    QuizView()
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundStyle(.pink.opacity(0.8))
                        .overlay(
                            Text("시작하기")
                                .font(R.font.pretendardSemiBold.swiftFontOfSize(18))
                                .foregroundStyle(.black)
                        )
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
