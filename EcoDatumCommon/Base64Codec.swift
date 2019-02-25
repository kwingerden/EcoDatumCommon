//
//  Base64Codec.swift
//  EcoDatumCommon
//
//  Created by Kenneth Wingerden on 2/25/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

typealias Base64Encoded = String

extension String {
    
    func base64Encode() -> Base64Encoded? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decode() -> String? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func base64DecodeUIImage() -> UIImage? {
        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: data)
    }
    
}

extension UIImage {
    
    func base64EncodedPNG() -> Base64Encoded? {
        return pngData()?.base64EncodedString()
    }
    
    func base64EncodedJPEG(compressionQuality: CGFloat) -> Base64Encoded? {
        return jpegData(compressionQuality: compressionQuality)?.base64EncodedString()
    }
    
}
