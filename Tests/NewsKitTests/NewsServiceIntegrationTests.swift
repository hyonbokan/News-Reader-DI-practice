//
//  NewsKitTests.swift
//  NewsKitTests
//
//  Created by Michael Kan on 2/20/25.
//

import XCTest
@testable import NewsKit

final class NewsServiceIntegrationTests: XCTestCase {
    
    var newsService: NewsService!
    
    // This method runs before every test to initialize objects needed for the test
    override func setUp() {
        super.setUp()
        newsService = NewsService() // ensures each test starts with a new instance of NewsService
    }
    
    // This method runs after every test to cleans up resources after each test case
    override func tearDown() {
        newsService = nil //  ensures we don’t reuse state between tests
        super.tearDown()
    }
    
    // Test: valid api call returns articles
    func testFetchTopHeadlinesSuccessfulResponse() {
        // Since API calls are asynchronous, we need expectation() - It pauses the test execution until the API call finishes.
        let expectation = self.expectation(description: "Fetching news is successful")
        
        newsService.fetchTopHeadlines { result in
            switch result {
            case .success(let articles):
                print("Articles fetched: \(articles.count)") // Debugging print statement
                XCTAssertFalse(articles.isEmpty, "Expected news articles but fetched empty array") // If successful, articles should not be empty
            case .failure(let error):
                XCTFail("Expected successful response but got error: \(error.localizedDescription)")
            }
            expectation.fulfill() // It signals that the asynchronous task is complete. Without it, the test would timeout and fail.
        }
        
        waitForExpectations(timeout: 10) // The test waits up to 10 seconds for expectation.fulfill() to be called.
    }
    
        // Test: api key missing (Should fail)
    func testFetchTopHeadlinesMissingAPIKey() {
        let expectation = self.expectation(description: "Fetching news fails due to missing API key")
        
        // Passing an empty API key
        let newsService = NewsService(apiKey: "")

        newsService.fetchTopHeadlines { result in
            switch result {
            case .success:
                XCTFail("Expected result failure due to missing API key")
            case .failure(let error):
                XCTAssertNotNil(error, "API key is missing")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
    }
    
    // Test: Invalid URL
    func testFetchTopHeadlinesInvalidURL() {
        let expectation = self.expectation(description: "Fetching news fails due to invalid URL")

        // Pass an invalid URL
        let invalidNewsService = NewsService(baseURL: "https://invalid-news-api.com")

        invalidNewsService.fetchTopHeadlines { result in
            switch result {
            case .success:
                XCTFail("Expected failure due to invalid URL")
            case .failure(let error):
                XCTAssertNotNil(error, "Expected an error but got nil")
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
    }
}
