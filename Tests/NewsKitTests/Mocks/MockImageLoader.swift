//
//  MockImageLoader.swift
//  NewsKit
//
//  Created by Michael Kan on 2/25/25.
//

import UIKit

class MockImageLoader: ImageLoaderProtocol {
    
    var shouldReturnError = false
    var mockImage: UIImage?
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, any Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "MockImageLoader", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked image loading error"])
            completion(.failure(error))
        } else {
            let image = mockImage ?? UIImage(systemName: "photo")!
            completion(.success(image))
        }
    }
}
