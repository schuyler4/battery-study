//
//  entryControllerTests.swift
//  battery study
//
//  Created by Marek Newton on 1/29/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest
@testable import battery_study

class entryControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerLoad() {
        let vc = EntryController()
        XCTAssertNotNil(vc.view)
        XCTAssert(vc.studys == getStudys())
    }
    
    func testRightNumberOfRows() {
        let vc: EntryController = EntryController()
        print(vc.tableView.numberOfRows(inSection: 1))
        XCTAssertEqual(getStudys().count, vc.tableView.numberOfRows(inSection: 1))
    }
    
}

