//
//  ChatPhoto.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes the photo of a chat
     */
    struct ChatPhoto: TDObjectProtocol {
        /**
         A small (160x160) chat photo
         */
        public let small: TDObject.File

        /**
         A big (640x640) chat photo
         */
        public let big: TDObject.File

        /**
         Describes the photo of a chat

         - Parameter small: A small (160x160) chat photo
         - Parameter big: A big (640x640) chat photo
         */
        public init(small: TDObject.File, big: TDObject.File) {
            self.small = small
            self.big = big
        }
    }
}
