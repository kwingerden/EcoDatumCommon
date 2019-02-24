//
//  DateFormat.swift
//  EcoDatumCommon
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

public extension Formatter {
    
    static let mediumDateStyleFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
}

public extension Date {
    
    func mediumFormatString() -> String {
        return Formatter.mediumDateStyleFormatter.string(from: self)
    }
    
    func iso8601String() -> String {
        return ISO8601DateFormatter().string(from: self)
    }
    
}

public extension String {
    
    func iso8601Date() -> Date? {
        return ISO8601DateFormatter().date(from: self)
    }
    
}
