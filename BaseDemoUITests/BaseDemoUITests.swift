//
//  BaseDemoUITests.swift
//  BaseDemoUITests
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import XCTest

class BaseDemoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Keep me logged in"].tap()
        app.buttons["LOGIN"].tap()
        app.buttons["ticket"].tap()
        app.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.swipeUp()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUI() {
        
    }

}
