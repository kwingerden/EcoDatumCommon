//
//  JSONCodec.swift
//  EcoDatumModel
//
//  Created by Kenneth Wingerden on 2/22/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public typealias JSON = String

public enum JSONCodecError: Error {
    case decoding
    case encoding
}

public func toJSON<T: Encodable>(_ value: T, _ formatting: JSONEncoder.OutputFormatting? = nil) throws -> JSON {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    if let formatting = formatting {
        encoder.outputFormatting = formatting
    }
    let data = try encoder.encode(value)
    guard let json = String(data: data, encoding: .utf8) else {
        throw JSONCodecError.encoding
    }
    return json
}

public func fromJSON<T: Decodable>(_ type: T.Type, _ json: JSON) throws -> T {
    guard let data = json.data(using: .utf8) else {
        throw JSONCodecError.decoding
    }
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    guard let value = try? decoder.decode(type, from: data) else {
        throw JSONCodecError.decoding
    }
    return value
}

