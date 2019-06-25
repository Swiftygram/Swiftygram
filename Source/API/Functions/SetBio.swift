//
//  SetBio.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the bio of the current user

     - ReturnType: `TDObject.Ok`
     */
    struct SetBio: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The new value of the user bio; 0-70 characters without line feeds
         */
        public let bio: String

        /**
         Changes the bio of the current user

         - Parameter bio: The new value of the user bio; 0-70 characters without line feeds
         */
        public init(bio: String) {
            self.bio = bio
        }
    }
}
