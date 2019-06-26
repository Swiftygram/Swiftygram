//
//  TextEntity.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a part of the text that needs to be formatted in some unusual way
     */
    struct TextEntity: TDObjectProtocol {
        /**
         Offset of the entity in UTF-16 code points
         */
        public let offset: Int

        /**
         Length of the entity, in UTF-16 code points
         */
        public let length: Int

        /**
         Type of the entity
         */
        public let type: TDEnum.TextEntityType

        /**
         Represents a part of the text that needs to be formatted in some unusual way

         - Parameter offset: Offset of the entity in UTF-16 code points
         - Parameter length: Length of the entity, in UTF-16 code points
         - Parameter type: Type of the entity
         */
        public init(offset: Int, length: Int, type: TDEnum.TextEntityType) {
            self.offset = offset
            self.length = length
            self.type = type
        }
    }
}
