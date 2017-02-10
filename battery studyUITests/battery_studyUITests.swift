//
//  battery_studyUITests.swift
//  battery studyUITests
//
//  Created by Marek Newton on 1/28/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest

class battery_studyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSelectTableRow() {
        XCUIApplication().tables.cells.containing(.staticText, identifier:"January 30, 2017").staticTexts["1"].tap()
        XCUIApplication().navigationBars["Detail"].buttons["back"].tap()
    }
    
    func testSelectGraphView() {
        let app = XCUIApplication()
        app.tables.buttons["Graph"].tap()
        app.navigationBars["Graph"].buttons["Back"].tap()
    }
    
    /*func testCreateNewStudy() {
        let app = XCUIApplication()
        app.tables.buttons["+"].tap()
        app.alerts["Unplug"].buttons["ok"].tap()
        app.buttons["Start Study"].tap()
        app.alerts["Study Done"].buttons["Yes"].tap()
    }
    
    func testDeleteStudy() {
        let app = XCUIApplication()
        app.buttons["Delete Study"].tap()
        app.alerts["Delete"].buttons["Yes"].tap()
    }*/
    
    func testQuitStudy() {
        let app = XCUIApplication()
        app.tables.buttons["+"].tap()
        app.alerts["Unplug"].buttons["ok"].tap()
        app.buttons["Start Study"].tap()
        app.buttons["quit study"].tap()
        app.navigationBars["Study"].buttons["back"].tap()
    }
}
