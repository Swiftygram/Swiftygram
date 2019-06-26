//
//  GetPasswordState.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the current state of 2-step verification

     - ReturnType: `TDObject.PasswordState`
     */
    struct GetPasswordState: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Returns the current state of 2-step verification
         */
        public init() {}
    }
}
