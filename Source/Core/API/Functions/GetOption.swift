//
//  GetOption.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization

     - ReturnType: `TDEnum.OptionValue`
     */
    struct GetOption: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.OptionValue

        /**
         The name of the option
         */
        public var name: String

        /**
         Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization

         - Parameter name: The name of the option
         */
        public init(name: String) {
            self.name = name
        }
    }
}
