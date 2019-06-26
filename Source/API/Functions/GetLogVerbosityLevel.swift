//
//  GetLogVerbosityLevel.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns current verbosity level of the internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.LogVerbosityLevel`
     */
    struct GetLogVerbosityLevel: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.LogVerbosityLevel

        /**
         Returns current verbosity level of the internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously
         */
        public init() {}
    }
}
