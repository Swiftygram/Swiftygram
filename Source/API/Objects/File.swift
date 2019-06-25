//
//  File.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a file
     */
    struct File: TDObjectProtocol {
        /**
         Unique file identifier
         */
        public let id: Int

        /**
         File size; 0 if unknown
         */
        public let size: Int

        /**
         Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress
         */
        public let expectedSize: Int

        /**
         Information about the local copy of the file
         */
        public let local: TDObject.LocalFile

        /**
         Information about the remote copy of the file
         */
        public let remote: TDObject.RemoteFile

        /**
         Represents a file

         - Parameter id: Unique file identifier
         - Parameter size: File size; 0 if unknown
         - Parameter expectedSize: Expected file size in case the exact file size is unknown, but an approximate size is known. Can be used to show download/upload progress
         - Parameter local: Information about the local copy of the file
         - Parameter remote: Information about the remote copy of the file
         */
        public init(id: Int, size: Int, expectedSize: Int, local: TDObject.LocalFile, remote: TDObject.RemoteFile) {
            self.id = id
            self.size = size
            self.expectedSize = expectedSize
            self.local = local
            self.remote = remote
        }
    }
}
