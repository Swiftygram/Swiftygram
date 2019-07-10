//
//  SetProfilePhoto.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Uploads a new profile photo for the current user. If something changes, updateUser will be sent

     - ReturnType: `TDObject.Ok`
     */
    struct SetProfilePhoto: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Profile photo to set. inputFileId and inputFileRemote may still be unsupported
         */
        public var photo: TDEnum.InputFile

        /**
         Uploads a new profile photo for the current user. If something changes, updateUser will be sent

         - Parameter photo: Profile photo to set. inputFileId and inputFileRemote may still be unsupported
         */
        public init(photo: TDEnum.InputFile) {
            self.photo = photo
        }
    }
}
