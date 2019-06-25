//
//  GetJsonString.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Converts a JsonValue object to corresponding JSON-serialized string. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Text`
     */
    struct GetJsonString: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         The JsonValue object
         */
        public let jsonValue: TDEnum.JsonValue

        /**
         Converts a JsonValue object to corresponding JSON-serialized string. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter jsonValue: The JsonValue object
         */
        public init(jsonValue: TDEnum.JsonValue) {
            self.jsonValue = jsonValue
        }
    }
}
