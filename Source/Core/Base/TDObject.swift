//
//  TDObject.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/24/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

/// Objects namespace
public class TDObject {}

/// Base protocol for all objects
public protocol TDObjectProtocol: Codable {}

extension TDObjectProtocol {
    
    static var type: String {
        let t = "\(self)"
        
        return t.prefix(1).lowercased() + t.dropFirst()
    }
    
    static var hashable: HashableType { return HashableType(self) }
    
}
