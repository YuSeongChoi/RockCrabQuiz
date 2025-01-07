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
        VStack(spacing: 30) {
            Text("바위게 퀴즈 - 무대의상 맞추기")
                .pretendSemiBold(size: 22)
            
            R.image.마니또.swiftImage
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            NavigationLink {
                QuizView()
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
        }
        .padding(EdgeInsets(top: 35, leading: 22, bottom: 35, trailing: 22))
    }
}

#Preview {
    HomeView()
}
