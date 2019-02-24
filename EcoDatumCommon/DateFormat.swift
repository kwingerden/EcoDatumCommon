//
//  DateFormat.swift
//  EcoDatumCommon
//
//  Created by Kenneth Wingerden on 2/23/19.
//  Copyright © 2019 Kenneth Wingerden. All rights reserved.
//

import Foundation

extension Formatter {
    
    static let mediumDateStyleFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
}

extension Date {
    
    func mediumFormattedDateString() -> String {
        return Formatter.mediumDateStyleFormatter.string(from: self)
    }
    
    func iso8601FormattedDateString() -> String {
        return ISO8601DateFormatter().string(from: self)
    }
    
}
