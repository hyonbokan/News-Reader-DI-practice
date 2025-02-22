//
//  NewsReaderUITestsLaunchTests.swift
//  NewsReaderUITests
//
//  Created by Khen Bo Kan on 2/22/25.
//

import XCTest

final class NewsViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        
        let apiKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"] ?? ""
        app.launchEnvironment["NEWS_API_KEY"] = apiKey
        
        app.launch()
        
        // UI tests should not continue after a failure
        continueAfterFailure = false
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testNewsListIsDisplayed() {
        let tableView = app.tables["NewsTableView"] // Use identifier
        XCTAssertTrue(tableView.waitForExistence(timeout: 10), "News table view should appear")
        
        sleep(3)
        
        let firstCell = tableView.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 10), "News articles should be loaded and visible")
    }
    

    func testTapNewsArticleOpensDetail() {
        let tableView = app.tables["NewsTableView"]
        let firstCell = tableView.cells.firstMatch
        
        firstCell.tap()
        
        let detailView = app.otherElements["NewsDetailView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 10), "News Detail View should appear")
    }

}
