//
//  GetFileExtension.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.Text`
     */
    struct GetFileExtension: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         The MIME type of the file
         */
        public var mimeType: String

        /**
         Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter mimeType: The MIME type of the file
         */
        public init(mimeType: String) {
            self.mimeType = mimeType
        }
    }
}
