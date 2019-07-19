//
//  CancelDownloadFile.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Stops the downloading of a file. If a file has already been downloaded, does nothing

     - ReturnType: `TDObject.Ok`
     */
    struct CancelDownloadFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of a file to stop downloading
         */
        public var fileId: Int

        /**
         Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
         */
        public var onlyIfPending: Bool

        /**
         Stops the downloading of a file. If a file has already been downloaded, does nothing

         - Parameter fileId: Identifier of a file to stop downloading
         - Parameter onlyIfPending: Pass true to stop downloading only if it hasn't been started, i.e. request hasn't been sent to server
         */
        public init(fileId: Int, onlyIfPending: Bool) {
            self.fileId = fileId
            self.onlyIfPending = onlyIfPending
        }
    }
}
