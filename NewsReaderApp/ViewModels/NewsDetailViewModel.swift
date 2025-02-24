//
//  NewDetailViewModel.swift
//  NewsReader
//
//  Created by Michael Kan on 2/24/25.
//

import Foundation
import NewsKit

final class NewsDetailViewModel {
    
    private(set) var article: NewsArticle
    
    init(article: NewsArticle) {
        self.article = article
    }
    
    var formattedDate: String {
        guard let date = ISO8601DateFormatter().date(from: article.publishedAt)
        else {
            return "Date unknown"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
