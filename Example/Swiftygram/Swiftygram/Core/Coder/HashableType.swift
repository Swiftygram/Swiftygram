//
//  HashableType.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/26/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

struct HashableType: Hashable {
    
    static func == (lhs: HashableType, rhs: HashableType) -> Bool {
        return lhs.base == rhs.base
    }
    
    let base: Any.Type
    
    init(_ base: Any.Type) {
        self.base = base
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(base))
    }

}
