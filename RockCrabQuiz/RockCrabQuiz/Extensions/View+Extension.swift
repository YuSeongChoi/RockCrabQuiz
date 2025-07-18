//
//  View+Extension.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 6/24/25.
//

import SwiftUI

extension View {
    func snapshotWithBackground(width: CGFloat, height :CGFloat, bgColor: UIColor? = nil) -> UIImage? {
        let content = ZStack {
            if let bg = bgColor.map(Color.init) {
                bg.edgesIgnoringSafeArea(.all)
            }
            self
        }
            .frame(width: width, height: height)
        
        let renderer = ImageRenderer(content: content)
        renderer.scale = UIScreen.main.scale
        return renderer.uiImage
    }
    
    func snapshot() -> UIImage? {
        // iOS 16 이하/이상 모두 호환되는 UIKit 기반 방식
        let controller = UIHostingController(
            rootView: self
                .ignoresSafeArea()     // SafeArea 무시하고 전체 화면 포함
                .fixedSize()           // 뷰의 고정 사이즈를 내부 콘텐츠에 맞춤
        )
        guard let view = controller.view else { return nil }

        let targetSize = view.intrinsicContentSize
        guard targetSize.width > 0, targetSize.height > 0 else { return nil }

        view.bounds = CGRect(origin: .zero, size: targetSize)
        view.backgroundColor = .systemBackground

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
    }
}
