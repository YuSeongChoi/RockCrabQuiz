//
//  QuizView.swift
//  RockTurtleQuiz
//
//  Created by YuSeongChoi on 9/13/24.
//

import SwiftUI

import RswiftResources

struct QuizView: View {
    
    
    var body: some View {
        VStack {
            Image(R.image.마니또)
                .resizable()
                .scaledToFit()
            Text("마니또 의상 맞추기")
        }
    }
}

#Preview {
    QuizView()
}
