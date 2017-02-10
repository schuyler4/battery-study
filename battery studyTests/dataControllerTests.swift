//
//  dataControllerTests.swift
//  battery study
//
//  Created by Marek Newton on 1/29/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest
@testable import battery_study

class dataControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetStudys() {
        let studys = getStudys()
        
        XCTAssertTrue(studys.count > 1)
    }
    
    func testStoreStudy() {
        /*let startCount: Int = getStudys().count
        storeStudy(startBattery: -0.6, endBattery: -0.8, date: Date())
        let endCount: Int = getStudys().count
        
        XCTAssertEqual(endCount, startCount + 1)
        XCTAssertEqual(getStudys()[endCount - 1].startBattery, -0.6)
        XCTAssertEqual(getStudys()[endCount - 1].endBattery, -0.8)*/
    }
}
