//
//  GetLogTagVerbosityLevel.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns current verbosity level for a specified TDLib internal log tag. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.LogVerbosityLevel`
     */
    struct GetLogTagVerbosityLevel: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.LogVerbosityLevel

        /**
         Logging tag to change verbosity level
         */
        public let tag: String

        /**
         Returns current verbosity level for a specified TDLib internal log tag. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter tag: Logging tag to change verbosity level
         */
        public init(tag: String) {
            self.tag = tag
        }
    }
}
