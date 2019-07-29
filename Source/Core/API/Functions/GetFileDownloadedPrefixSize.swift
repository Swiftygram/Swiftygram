//
//  GetFileDownloadedPrefixSize.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns file downloaded prefix size from a given offset

     - ReturnType: `TDObject.Count`
     */
    struct GetFileDownloadedPrefixSize: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Count

        /**
         Identifier of the file
         */
        public var fileId: Int

        /**
         Offset from which downloaded prefix size should be calculated
         */
        public var offset: Int

        /**
         Returns file downloaded prefix size from a given offset

         - Parameter fileId: Identifier of the file
         - Parameter offset: Offset from which downloaded prefix size should be calculated
         */
        public init(fileId: Int, offset: Int) {
            self.fileId = fileId
            self.offset = offset
        }
    }
}
