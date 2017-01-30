//
//  studyControllerTest.swift
//  battery study
//
//  Created by Marek Newton on 1/29/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest
@testable import battery_study

class studyControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerLoad() {
        let vc = StudyController()
        XCTAssertNotNil(vc.view, "view did not load")
    }
}
