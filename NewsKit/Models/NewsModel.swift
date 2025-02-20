//
//  NewsModel.swift
//  NewsKit
//
//  Created by Michael Kan on 2/20/25.
//

import Foundation
// Main response model
public struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

// News article model
public struct NewsArticle: Codable {
    public let source: NewsSource?
    public let author: String?
    public let title: String
    public let description: String?
    public let url: String
    public let urlToImage: String?
    public let publishedAt: String
}

// Source model
public struct NewsSource: Codable {
    public let id: String?
    public let name: String
}
