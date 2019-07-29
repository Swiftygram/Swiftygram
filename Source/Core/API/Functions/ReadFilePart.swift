//
//  ReadFilePart.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct read from the file

     - ReturnType: `TDObject.FilePart`
     */
    struct ReadFilePart: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.FilePart

        /**
         Identifier of the file. The file must be located in the TDLib file cache
         */
        public var fileId: Int

        /**
         The offset from which to read the file
         */
        public var offset: Int

        /**
         Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
         */
        public var count: Int

        /**
         Reads a part of a file from the TDLib file cache and returns read bytes. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct read from the file

         - Parameter fileId: Identifier of the file. The file must be located in the TDLib file cache
         - Parameter offset: The offset from which to read the file
         - Parameter count: Number of bytes to read. An error will be returned if there are not enough bytes available in the file from the specified position. Pass 0 to read all available data from the specified position
         */
        public init(fileId: Int, offset: Int, count: Int) {
            self.fileId = fileId
            self.offset = offset
            self.count = count
        }
    }
}
