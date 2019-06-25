//
//  SetLogTagVerbosityLevel.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the verbosity level for a specified TDLib internal log tag. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Ok`
     */
    struct SetLogTagVerbosityLevel: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Logging tag to change verbosity level
         */
        public let tag: String

        /**
         New verbosity level; 1-1024
         */
        public let newVerbosityLevel: Int

        /**
         Sets the verbosity level for a specified TDLib internal log tag. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter tag: Logging tag to change verbosity level
         - Parameter newVerbosityLevel: New verbosity level; 1-1024
         */
        public init(tag: String, newVerbosityLevel: Int) {
            self.tag = tag
            self.newVerbosityLevel = newVerbosityLevel
        }
    }
}
