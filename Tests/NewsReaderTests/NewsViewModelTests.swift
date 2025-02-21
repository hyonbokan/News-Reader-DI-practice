//
//  NewsViewModelTests.swift
//  NewsReaderTests
//
//  Created by Michael Kan on 2/21/25.
//

import XCTest
@testable import NewsReader
@testable import NewsKit

final class NewsViewModelTests: XCTestCase {
    
    var viewModel: NewsViewModel!
    var mockService: MockNewsService!
    
    override func setUp() {
        super.setUp()
        mockService = MockNewsService()
        viewModel = NewsViewModel(newsService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    // Test successful fetching headlines
    func testFetchTopHeadlines_Success() {
        let expectation = self.expectation(description: "Successful news fetch")
        
        mockService.mockArticles = [
            NewsArticle(source: nil, author: "author", title: "title", description: "description", url: "url", urlToImage: nil, publishedAt: "publisher")
        ]
        
        viewModel.onNewsUpdate = { articles in
            XCTAssertEqual(articles.count, 1, "Expected 1 article, but got \(articles.count)")
            XCTAssertEqual(articles.first?.title, "title", "Unexpected article title")
            expectation.fulfill()
        }
        
        viewModel.fetchTopHeadlines()
        waitForExpectations(timeout: 3)
    }
    
    // Test failure (sim API error)
    func testFetchTopHeadLines_Failure() {
        let expectation = self.expectation(description: "News fetch failure")
        
        mockService.shouldReturnError = true // sim api failure
        
        viewModel.onError = { errorMessage in
            XCTAssertFalse(errorMessage.isEmpty, "Expected error message but got empty string")
            expectation.fulfill()
        }
        
        viewModel.fetchTopHeadlines()
        waitForExpectations(timeout: 3)
    }
}
