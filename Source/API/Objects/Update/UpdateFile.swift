//
//  UpdateFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Information about a file was updated
     */
    struct UpdateFile: TDObject.Update {
        /**
         New data about the file
         */
        public let file: TDObject.File

        /**
         Information about a file was updated

         - Parameter file: New data about the file
         */
        public init(file: TDObject.File) {
            self.file = file
        }
    }
}
