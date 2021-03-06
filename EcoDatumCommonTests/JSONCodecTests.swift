//
//  JSONCodecTests.swift
//  EcoDatumCommonTests
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
import SwiftyBeaver
@testable import EcoDatumCommon

class JSONCodecTests: XCTestCase {
    
    let log = SwiftyBeaver.self
    let consoleDestination = ConsoleDestination()
    
    struct Embedded: Codable {
        let attr1: String
        let attr2: Int
    }
    
    struct Test: Codable, Equatable {
        let attr1: Embedded
        let attr2: Decimal
        static func == (lhs: Test, rhs: Test) -> Bool {
            return lhs.attr1.attr1 == rhs.attr1.attr1 &&
                lhs.attr1.attr2 == rhs.attr1.attr2 &&
                lhs.attr2 == rhs.attr2
        }
    }
    
    override func setUp() {
        if !log.destinations.contains(consoleDestination) {
            log.addDestination(consoleDestination)
        }
    }
    
    override func tearDown() {
    }
    
    func testEncodeDecode() throws {
        let embedded = Embedded(attr1: "value1", attr2: 34)
        let test1 = Test(attr1: embedded, attr2: 11.33)
        
        let json = try toJSON(test1, .prettyPrinted)
        log.debug("JSON:\n \(json)")
        XCTAssert(json == """
            {
              "attr1" : {
                "attr1" : "value1",
                "attr2" : 34
              },
              "attr2" : 11.33
            }
            """)
        
        let test2 = try fromJSON(Test.self, json)
        XCTAssert(test1 == test2)
    }
    
}
