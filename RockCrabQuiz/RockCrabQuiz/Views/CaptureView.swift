//
//  CaptureView.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 7/18/25.
//

import SwiftUI

struct CaptureView<Content: View>: UIViewRepresentable {
    let content: Content
    let onSnapshotReady: (UIView) -> Void
    
    init(@ViewBuilder content: () -> Content, onSnapshotReady: @escaping (UIView) -> Void) {
        self.content = content()
        self.onSnapshotReady = onSnapshotReady
    }
    
    func makeUIView(context: Context) -> UIView {
        let hosting = UIHostingController(rootView: content)
        hosting.view.backgroundColor = .clear
        DispatchQueue.main.async {
            self.onSnapshotReady(hosting.view)
        }
        return hosting.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}
