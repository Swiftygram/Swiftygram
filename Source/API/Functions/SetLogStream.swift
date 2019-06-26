//
//  SetLogStream.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets new log stream for internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Ok`
     */
    struct SetLogStream: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         New log stream
         */
        public let logStream: TDEnum.LogStream

        /**
         Sets new log stream for internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter logStream: New log stream
         */
        public init(logStream: TDEnum.LogStream) {
            self.logStream = logStream
        }
    }
}
