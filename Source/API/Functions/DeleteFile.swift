//
//  DeleteFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes a file from the TDLib file cache

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the file to delete
         */
        public let fileId: Int

        /**
         Deletes a file from the TDLib file cache

         - Parameter fileId: Identifier of the file to delete
         */
        public init(fileId: Int) {
            self.fileId = fileId
        }
    }
}
