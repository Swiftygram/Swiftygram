//
//  AnyCodingKey.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 6/1/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

struct AnyCodingKey: CodingKey {
    
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        intValue = nil
    }
    
    init?(intValue: Int) {
        stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(string: String) {
        stringValue = string
        intValue = nil
    }
    
}
