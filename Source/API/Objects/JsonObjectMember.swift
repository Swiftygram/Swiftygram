//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents one member of a JSON object
     */
    struct JsonObjectMember: TDObjectProtocol {
        /**
         Member's key
         */
        public var key: String

        /**
         Member's value
         */
        public var value: TDEnum.JsonValue

        /**
         Represents one member of a JSON object

         - Parameter key: Member's key
         - Parameter value: Member's value
         */
        public init(key: String, value: TDEnum.JsonValue) {
            self.key = key
            self.value = value
        }
    }
}
