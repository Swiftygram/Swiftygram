//
//  GetFileMimeType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Text`
     */
    struct GetFileMimeType: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         The name of the file or path to the file
         */
        public var fileName: String

        /**
         Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter fileName: The name of the file or path to the file
         */
        public init(fileName: String) {
            self.fileName = fileName
        }
    }
}
