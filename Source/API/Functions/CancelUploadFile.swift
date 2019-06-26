//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined

     - ReturnType: `TDObject.Ok`
     */
    struct CancelUploadFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the file to stop uploading
         */
        public var fileId: Int

        /**
         Stops the uploading of a file. Supported only for files uploaded by using uploadFile. For other files the behavior is undefined

         - Parameter fileId: Identifier of the file to stop uploading
         */
        public init(fileId: Int) {
            self.fileId = fileId
        }
    }
}
