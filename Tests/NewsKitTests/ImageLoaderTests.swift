//
//  ImageLoaderTests.swift
//  NewsReader
//
//  Created by Michael Kan on 2/25/25.
//

import XCTest
@testable import NewsKit

final class ImageLoaderTests: XCTestCase {
    
    var mockImageLoader: MockImageLoader!
    
    override func setUp() {
        super.setUp()
        mockImageLoader = MockImageLoader()
    }
    
    override func tearDown() {
        mockImageLoader = nil
        super.tearDown()
    }
    
    // Test: Image is loaded successfully
    func testLoadImage_Success() {
        let expectation = self.expectation(description: "Image loaded successfully")
        
        mockImageLoader.mockImage = UIImage(systemName: "photo") // Providing a mock image
        
        mockImageLoader.loadImage(from: URL(string: "https://mock-image.com/image.jpg")!) { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image, "Expected image, but got nil")
            case .failure:
                XCTFail("Expected successful image load, but got failure")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3)
    }
    
    // Test: Image fails to load
    func testLoadImage_Failure() {
        let expectation = self.expectation(description: "Image loading fails")
        
        mockImageLoader.shouldReturnError = true // Simulating an error case
        
        mockImageLoader.loadImage(from: URL(string: "https://mock-image.com/image.jpg")!) { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got a valid image")
            case .failure(let error):
                XCTAssertNotNil(error, "Expected an error but got nil")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3)
    }
}
