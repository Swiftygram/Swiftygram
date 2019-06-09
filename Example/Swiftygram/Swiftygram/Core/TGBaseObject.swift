//
//  TGBaseObject.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/24/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public protocol TGBaseObjectProtocol {
    
//    static var id: Int { get }
    
}

open class TGBaseObject {
    
    open class var type: String {
        let t = "\(self)"
        
        return t.prefix(1).lowercased() + t.dropFirst()
//        return "\(self)"
    }
    
    class var hashable: HashableType { return HashableType(self) }
    
}
