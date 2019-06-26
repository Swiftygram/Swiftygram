//
//  GetRemoteFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message

     - ReturnType: `TDObject.File`
     */
    struct GetRemoteFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         Remote identifier of the file to get
         */
        public let remoteFileId: String

        /**
         File type, if known
         */
        public let fileType: TDEnum.FileType

        /**
         Returns information about a file by its remote ID; this is an offline request. Can be used to register a URL as a file for further uploading, or sending as a message

         - Parameter remoteFileId: Remote identifier of the file to get
         - Parameter fileType: File type, if known
         */
        public init(remoteFileId: String, fileType: TDEnum.FileType) {
            self.remoteFileId = remoteFileId
            self.fileType = fileType
        }
    }
}
