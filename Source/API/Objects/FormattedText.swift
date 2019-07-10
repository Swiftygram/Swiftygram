//
//  FormattedText.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A text with some entities
     */
    struct FormattedText: TDObjectProtocol {
        /**
         The text
         */
        public var text: String

        /**
         Entities contained in the text
         */
        public var entities: [TDObject.TextEntity]

        /**
         A text with some entities

         - Parameter text: The text
         - Parameter entities: Entities contained in the text
         */
        public init(text: String, entities: [TDObject.TextEntity]) {
            self.text = text
            self.entities = entities
        }
    }
}
