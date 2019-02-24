//
//  DateFormatTests.swift
//  EcoDatumCommonTests
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
@testable import EcoDatumCommon

class DateFormatTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func test() throws {
        let dateString1 = "2019-02-24T04:38:31Z"
        guard let date1 = dateString1.iso8601Date() else {
            XCTFail()
            return
        }
        let dateString2 = date1.iso8601String()
        XCTAssert(dateString1 == dateString2)
    }
    
}
