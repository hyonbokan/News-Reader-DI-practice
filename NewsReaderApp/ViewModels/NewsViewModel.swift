//
//  NewViewModel.swift
//  NewsReader
//
//  Created by Michael Kan on 2/21/25.
//

import Foundation
import NewsKit

class NewsViewModel {
    
    private let newsService: NewsServiceProtocol
    
    private var articles: [NewsArticle] = []
    
    var onNewsUpdate: (([NewsArticle]) -> Void)?
    var onError: ((String) -> Void)?
    
    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }
    
    func fetchTopHeadlines() {
        newsService.fetchTopHeadlines { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.onNewsUpdate?(articles)
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
    
}
