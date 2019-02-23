//
//  DataCodec.swift
//  EcoDatumCommon
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation
import UIKit

let JPEG_COMPRESSION_QUALITY: CGFloat = 0.5

extension UIImage {
    
    func defaultJpegData() -> Data? {
        return  jpegData(compressionQuality: JPEG_COMPRESSION_QUALITY)
    }
    
}
