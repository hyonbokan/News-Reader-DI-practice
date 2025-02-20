//
//  NewsServiceProtocol.swift
//  NewsKit
//
//  Created by Michael Kan on 2/20/25.
//

import Foundation

public protocol NewsServiceProtocol {
    func fetchTopHeadlines(completion: @escaping (Result<[NewsArticle], Error>) -> Void)
}
