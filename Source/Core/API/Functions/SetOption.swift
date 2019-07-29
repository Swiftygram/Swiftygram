//
//  SetOption.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct SetOption: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The name of the option
         */
        public var name: String

        /**
         The new value of the option
         */
        public var value: TDEnum.OptionValue

        /**
         Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization

         - Parameter name: The name of the option
         - Parameter value: The new value of the option
         */
        public init(name: String, value: TDEnum.OptionValue) {
            self.name = name
            self.value = value
        }
    }
}
