//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of text entities
     */
    struct TextEntities: TDObjectProtocol {
        /**
         List of text entities
         */
        public var entities: [TDObject.TextEntity]

        /**
         Contains a list of text entities

         - Parameter entities: List of text entities
         */
        public init(entities: [TDObject.TextEntity]) {
            self.entities = entities
        }
    }
}
