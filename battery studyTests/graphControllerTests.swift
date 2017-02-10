//
//  graphControllerTests.swift
//  battery study
//
//  Created by Marek Newton on 2/9/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import XCTest
@testable import battery_study

class graphControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewDidLoad() {
        let graphController: GraphController = GraphController()
        graphController.viewDidLoad()
    }
    
}
