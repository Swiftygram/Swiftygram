//
//  UpdateOption.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     An option changed its value
     */
    struct UpdateOption: TDObject.Update {
        /**
         The option name
         */
        public let name: String

        /**
         The new option value
         */
        public let value: TDEnum.OptionValue

        /**
         An option changed its value

         - Parameter name: The option name
         - Parameter value: The new option value
         */
        public init(name: String, value: TDEnum.OptionValue) {
            self.name = name
            self.value = value
        }
    }
}
