//
//  CleanFileName.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Text`
     */
    struct CleanFileName: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         File name or path to the file
         */
        public let fileName: String

        /**
         Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter fileName: File name or path to the file
         */
        public init(fileName: String) {
            self.fileName = fileName
        }
    }
}
