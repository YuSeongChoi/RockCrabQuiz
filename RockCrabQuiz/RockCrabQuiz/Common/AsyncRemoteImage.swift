//
//  AsyncRemoteImage.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 6/24/25.
//

import SwiftUI

struct AsyncRemoteImage: View {
    let urlString: String
    var onSuccess: () -> Void = {}
    
    var body: some View {
        if let url = URL(string: urlString) {
            AsyncImage(
                url: url,
                transaction: Transaction(animation: .easeInOut(duration: 0.3))
            ) { phase in
                switch phase {
                case .success(let img):
                    ZStack {
                        Color.white
                        
                        img
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .transition(.opacity)
                            .onAppear {
                                onSuccess()
                            }
                    }
                case .failure:
                  Image(systemName: "photo")
                default:
                  ZStack { Color.gray.opacity(0.2); ProgressView() }
                }
            }
            .cornerRadius(10)
            .id(urlString)
        } else {
            Image(systemName: "photo")
        }
    }
}
