//
//  AddLogMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a message to TDLib internal log. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Ok`
     */
    struct AddLogMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Minimum verbosity level needed for the message to be logged, 0-1023
         */
        public let verbosityLevel: Int

        /**
         Text of a message to log
         */
        public let text: String

        /**
         Adds a message to TDLib internal log. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter verbosityLevel: Minimum verbosity level needed for the message to be logged, 0-1023
         - Parameter text: Text of a message to log
         */
        public init(verbosityLevel: Int, text: String) {
            self.verbosityLevel = verbosityLevel
            self.text = text
        }
    }
}
