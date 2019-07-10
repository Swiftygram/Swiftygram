//
//  Error.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     An object of this type can be returned on every function call, in case of an error
     */
    struct Error: TDObjectProtocol {
        /**
         Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
         */
        public var code: Int

        /**
         Error message; subject to future changes
         */
        public var message: String

        /**
         An object of this type can be returned on every function call, in case of an error

         - Parameter code: Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
         - Parameter message: Error message; subject to future changes
         */
        public init(code: Int, message: String) {
            self.code = code
            self.message = message
        }
    }
}
