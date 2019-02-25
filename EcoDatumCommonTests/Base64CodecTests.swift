//
//  Base64CodecTests.swift
//  EcoDatumCommonTests
//
//  Created by Kenneth Wingerden on 2/25/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import XCTest
import UIKit
@testable import EcoDatumCommon

class Base64CodecTests: XCTestCase {

    func test1() throws {
        let string1 = "The quick brown fox jumps over the lazy dog."
        guard let encoded1 = string1.base64Encode(),
            let string2 = encoded1.base64Decode() else {
            XCTFail()
            return
        }
        XCTAssert(string1 == string2)
    }
    
    func test2() throws {
        let bundle = Bundle(for: type(of: self))
        guard let test1JPGURL = bundle.url(forResource: "test1", withExtension: "jpeg"),
            let test1JPGData = try? Data(contentsOf: test1JPGURL),
            let test1UIImage = UIImage(data: test1JPGData),
            let test1Base64Encoded = test1UIImage.base64EncodedPNG(),
            let test2UIImage = test1Base64Encoded.base64DecodeUIImage() else {
                XCTFail()
                return
        }
        XCTAssert(test1UIImage.pngData() == test2UIImage.pngData())
    }
    
}
