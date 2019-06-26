//
//  GetJsonValue.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Converts a JSON-serialized string to corresponding JsonValue object. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDEnum.JsonValue`
     */
    struct GetJsonValue: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.JsonValue

        /**
         The JSON-serialized string
         */
        public let json: String

        /**
         Converts a JSON-serialized string to corresponding JsonValue object. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter json: The JSON-serialized string
         */
        public init(json: String) {
            self.json = json
        }
    }
}
