//
//  ImageLoader.swift
//  NewsKit
//
//  Created by Michael Kan on 2/25/25.
//

import UIKit

public protocol ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void)
}

final public class ImageLoader: ImageLoaderProtocol {
    
    public static let shared = ImageLoader()
    
    private let imageCache = NSCache<NSURL, UIImage>()
    
    public init() {} // public init for DI
    
    
    public func loadImage(from url: URL, completion: @escaping (Result<UIImage, any Error>) -> Void) {
        // check cache first
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(.success(cachedImage))
            return
        }
        
        // if not, download image
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let self = self, let data = data, let image = UIImage(data: data)
            else {
                let error = NSError(domain: "ImageLoader", code: -1, userInfo: [NSLocalizedDescriptionKey : "Unable to load image"])
                completion(.failure(error))
                return
            }
            // cache the image for future use
            self.imageCache.setObject(image, forKey: url as NSURL)
            completion(.success(image))
        }.resume()
        
    }
    
}
