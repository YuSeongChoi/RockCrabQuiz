//
//  ImageSaver.swift
//  RockCrabQuiz
//
//  Created by YuSeongChoi on 7/18/25.
//

import UIKit

class ImageSaver: NSObject {
    @MainActor static let shared = ImageSaver()
    private override init() { super.init() }

    var completion: ((Result<Void, Error>) -> Void)?

    func writeToPhotoAlbum(image: UIImage, completion: @escaping (Result<Void,Error>) -> Void) {
        self.completion = completion
        UIImageWriteToSavedPhotosAlbum(image, self,
            #selector(saveCompleted(_:didFinishSavingWithError:contextInfo:)),
            nil)
    }

    @objc private func saveCompleted(_ image: UIImage,
                                     didFinishSavingWithError error: Error?,
                                     contextInfo: UnsafeRawPointer) {
        if let err = error {
            completion?(.failure(err))
        } else {
            completion?(.success(()))
        }
    }
}
