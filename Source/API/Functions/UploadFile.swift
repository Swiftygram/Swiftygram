//
//  UploadFile.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message

     - ReturnType: `TDObject.File`
     */
    struct UploadFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         File to upload
         */
        public var file: TDEnum.InputFile

        /**
         File type
         */
        public var fileType: TDEnum.FileType

        /**
         Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
         */
        public var priority: Int

        /**
         Asynchronously uploads a file to the cloud without sending it in a message. updateFile will be used to notify about upload progress and successful completion of the upload. The file will not have a persistent remote identifier until it will be sent in a message

         - Parameter file: File to upload
         - Parameter fileType: File type
         - Parameter priority: Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which uploadFile was called will be uploaded first
         */
        public init(file: TDEnum.InputFile, fileType: TDEnum.FileType, priority: Int) {
            self.file = file
            self.fileType = fileType
            self.priority = priority
        }
    }
}
