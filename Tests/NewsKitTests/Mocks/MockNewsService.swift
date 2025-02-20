//
//  MockNewsService.swift
//  NewsReader
//
//  Created by Michael Kan on 2/20/25.
//

import Foundation

class MockNewsService: NewsServiceProtocol {
    
    var shouldReturnError = false
    var mockArticles: [NewsArticle] = []
    
    public init() {}
    
    func fetchTopHeadlines(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "MockError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Mocked error"])))
        } else {
            completion(.success(mockArticles))
        }
    }
}
