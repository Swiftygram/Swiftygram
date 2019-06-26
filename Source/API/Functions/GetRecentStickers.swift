//
//  GetRecentStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of recently used stickers

     - ReturnType: `TDObject.Stickers`
     */
    struct GetRecentStickers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Stickers

        /**
         Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
         */
        public let isAttached: Bool

        /**
         Returns a list of recently used stickers

         - Parameter isAttached: Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
         */
        public init(isAttached: Bool) {
            self.isAttached = isAttached
        }
    }
}
