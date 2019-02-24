//
//  Base64CodecTests.swift
//  EcoDatumCommonTests
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import XCTest
@testable import EcoDatumCommon

class Base64CodecTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testEncodeDecode() throws {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "test1", ofType: "jpeg"),
            let image1 = UIImage(contentsOfFile: path),
            let base64Encoded1 = image1.base64Encode(),
            let data1 = base64Encoded1.base64Decode(),
            let image2 = UIImage(data: data1) else {
                XCTFail()
                return
        }
        
        XCTAssert(image1.pngData() == image2.pngData())
    }
    
}
