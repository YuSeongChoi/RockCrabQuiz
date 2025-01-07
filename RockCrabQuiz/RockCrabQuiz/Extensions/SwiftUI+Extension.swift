//
//  SwiftUI+Extension.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 1/7/25.
//

import SwiftUI
import RswiftResources

extension Text {
    func NotoSansReg(size: CGFloat) -> Text {
        self.font(R.font.notoSansCJKkrRegular.swiftFontOfSize(size))
    }
    
    func NotoSansMid(size: CGFloat) -> Text {
        self.font(R.font.notoSansCJKkrMedium.swiftFontOfSize(size))
    }
    
    func NotoSansBold(size: CGFloat) -> Text {
        self.font(R.font.notoSansCJKkrBold.swiftFontOfSize(size))
    }
    
    func LatoReg(size: CGFloat) -> Text {
        self.font(R.font.latoRegular.swiftFontOfSize(size))
    }
    
    func LatoBold(size: CGFloat) -> Text {
        self.font(R.font.latoBold.swiftFontOfSize(size))
    }
    
    func pretendBold(size: CGFloat) -> Text {
        self.font(R.font.pretendardBold.swiftFontOfSize(size))
    }
    
    func pretendSemiBold(size: CGFloat) -> Text {
        self.font(R.font.pretendardSemiBold.swiftFontOfSize(size))
    }
    
    func pretendMid(size: CGFloat) -> Text {
        self.font(R.font.pretendardMedium.swiftFontOfSize(size))
    }
    
    func pretendReg(size: CGFloat) -> Text {
        self.font(R.font.pretendardRegular.swiftFontOfSize(size))
    }
}

extension View {
    func NotoSansReg(size: CGFloat) -> some View {
        self.font(R.font.notoSansCJKkrRegular.swiftFontOfSize(size))
    }
    
    func NotoSansMid(size: CGFloat) -> some View {
        self.font(R.font.notoSansCJKkrMedium.swiftFontOfSize(size))
    }
    
    func NotoSansBold(size: CGFloat) -> some View {
        self.font(R.font.notoSansCJKkrBold.swiftFontOfSize(size))
    }
    
    func LatoReg(size: CGFloat) -> some View {
        self.font(R.font.latoRegular.swiftFontOfSize(size))
    }
    
    func LatoBold(size: CGFloat) -> some View {
        self.font(R.font.latoBold.swiftFontOfSize(size))
    }
    
    func pretendSemiBold(size: CGFloat) -> some View {
        self.font(R.font.pretendardSemiBold.swiftFontOfSize(size))
    }
    
    func pretendBold(size: CGFloat) -> some View {
        self.font(R.font.pretendardBold.swiftFontOfSize(size))
    }
    
    func pretendMid(size: CGFloat) -> some View {
        self.font(R.font.pretendardMedium.swiftFontOfSize(size))
    }
    
    func pretendReg(size: CGFloat) -> some View {
        self.font(R.font.pretendardRegular.swiftFontOfSize(size))
    }
}

extension View {
    func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
