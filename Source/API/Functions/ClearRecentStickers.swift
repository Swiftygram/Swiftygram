//
//  ClearRecentStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Clears the list of recently used stickers

     - ReturnType: `TDObject.Ok`
     */
    struct ClearRecentStickers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
         */
        public let isAttached: Bool

        /**
         Clears the list of recently used stickers

         - Parameter isAttached: Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
         */
        public init(isAttached: Bool) {
            self.isAttached = isAttached
        }
    }
}
