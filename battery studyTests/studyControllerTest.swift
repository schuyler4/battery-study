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
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewDidLoad() {
        let vc = StudyController()
        vc.viewDidLoad()
        
        XCTAssertNotNil(vc.view)
        //XCTAssert(vc.timePicker?.delegate != nil)
        //XCTAssert(vc.timePicker?.dataSource != nil)
        XCTAssert(vc.timeLabel?.text == "0")
    }
}
