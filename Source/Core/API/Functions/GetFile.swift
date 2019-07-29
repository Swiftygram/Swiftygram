//
//  GetFile.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a file; this is an offline request

     - ReturnType: `TDObject.File`
     */
    struct GetFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         Identifier of the file to get
         */
        public var fileId: Int

        /**
         Returns information about a file; this is an offline request

         - Parameter fileId: Identifier of the file to get
         */
        public init(fileId: Int) {
            self.fileId = fileId
        }
    }
}
