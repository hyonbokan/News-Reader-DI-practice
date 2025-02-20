//
//  NewsServiceTests.swift
//  NewsReader
//
//  Created by Michael Kan on 2/20/25.
//

import XCTest
@testable import NewsKit

final class NewsServiceTests: XCTestCase {
    
    var mockService: MockNewsService!
    
    override func setUp() {
        super.setUp()
        mockService = MockNewsService()
    }
    
    override func tearDown() {
        mockService = nil
        super.tearDown()
    }
    
    // Test: Mocked success response
    func testFetchTopHeadlines_MockedSuccess() {
        let expectation = self.expectation(description: "Mock script success")
        
        mockService.mockArticles = [
            NewsArticle(source: nil, author: "author", title: "title", description: "description", url: "url", urlToImage: "url to image", publishedAt: "published data")
        ]
        
        mockService.fetchTopHeadlines { result in
            switch result {
            case .success(let articles):
                XCTAssertFalse(articles.isEmpty, "Expected mock articles, but got empty array")
                XCTAssertEqual(articles.count, 1, "Expected 1 mock article")
                XCTAssertEqual(articles.first?.title, "title", "Expected article title to match")
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    // Test: Mocked failure response
    func testFetchTopHeadlines_MockedFailure() {
        let expectation = self.expectation(description: "Mocked fetch news failure")
        
        // force the modck to return an error
        mockService.shouldReturnError = true
        
        mockService.fetchTopHeadlines { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Mocked error", "Expected mocked error message")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3)
    }
}
