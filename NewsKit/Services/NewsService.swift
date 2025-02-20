//
//  NewsService.swift
//  NewsKit
//
//  Created by Michael Kan on 2/20/25.
//

import Foundation

public class NewsService: NewsServiceProtocol {
    
    private let apiKey: String
    private let baseURL: String
    
    public init(apiKey: String? = nil, baseURL: String = "https://newsapi.org/v2/top-headlines?country=us&apiKey=") {
        self.apiKey = apiKey ?? ProcessInfo.processInfo.environment["NEWS_API_KEY"] ?? ""
        self.baseURL = baseURL
    }
    
    public func fetchTopHeadlines(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        guard !apiKey.isEmpty else {
            completion(.failure(NSError(domain: "APIKeyError", code: 401, userInfo: [NSLocalizedDescriptionKey :  "API key is missing"])))
            return
        }
        
        let urlString = "\(baseURL)\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URLError", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: 500, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(decodedResponse.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
