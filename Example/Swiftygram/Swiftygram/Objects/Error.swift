//
//  Error.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    /**
     * An object of this type can be returned on every function call, in case of an error.
     */
    public class Error: TGObjectProtocol, Swift.Error {
        
        /// Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user.
        var code: Int
        
        /// Error message; subject to future changes.
        var message: String

        /**
         * An object of this type can be returned on every function call, in case of an error.
         *
         * - Parameter code: Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user.
         * - Parameter message: Error message; subject to future changes.
         */
        public init(code: Int, message: String) {
            self.code = code
            self.message = message
        }
        
    }
    
}
