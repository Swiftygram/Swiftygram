//
//  TextEntity.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    public class TextEntity: TGObjectProtocol {
        
        var offset: Int
        var length: Int
        var type: TGEnum.TextEntityType

        public init(offset: Int, length: Int, type: TGEnum.TextEntityType) {
            self.offset = offset
            self.length = length
            self.type = type
        }
        
    }
    
}
