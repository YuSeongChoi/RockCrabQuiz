//
//  AsyncRemoteImage.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 6/24/25.
//

import SwiftUI

struct AsyncRemoteImage: View {
    let urlString: String
    var placeholder: AnyView = AnyView(ProgressView())
    var errorImage: AnyView = AnyView(Image(systemName: "photo"))
    
    var body: some View {
        if let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    errorImage
                @unknown default:
                    errorImage
                }
            }
        } else {
            errorImage
        }
    }
}
