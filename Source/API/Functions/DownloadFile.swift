//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates

     - ReturnType: `TDObject.File`
     */
    struct DownloadFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         Identifier of the file to download
         */
        public var fileId: Int

        /**
         Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
         */
        public var priority: Int

        /**
         The starting position from which the file should be downloaded
         */
        public var offset: Int

        /**
         Number of bytes which should be downloaded starting from the "offset" position before the download will be automatically cancelled; use 0 to download without a limit
         */
        public var limit: Int

        /**
         If false, this request returns file state just after the download has been started. If true, this request returns file state only after-the download has succeeded, has failed, has been cancelled or a new downloadFile request with different offset/limit parameters was sent
         */
        public var synchronous: Bool

        /**
         Downloads a file from the cloud. Download progress and completion of the download will be notified through updateFile updates

         - Parameter fileId: Identifier of the file to download
         - Parameter priority: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile was called will be downloaded first
         - Parameter offset: The starting position from which the file should be downloaded
         - Parameter limit: Number of bytes which should be downloaded starting from the "offset" position before the download will be automatically cancelled; use 0 to download without a limit
         - Parameter synchronous: If false, this request returns file state just after the download has been started. If true, this request returns file state only after-the download has succeeded, has failed, has been cancelled or a new downloadFile request with different offset/limit parameters was sent
         */
        public init(fileId: Int, priority: Int, offset: Int, limit: Int, synchronous: Bool) {
            self.fileId = fileId
            self.priority = priority
            self.offset = offset
            self.limit = limit
            self.synchronous = synchronous
        }
    }
}
