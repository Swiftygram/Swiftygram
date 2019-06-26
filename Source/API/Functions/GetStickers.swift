//
//  GetStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned

     - ReturnType: `TDObject.Stickers`
     */
    struct GetStickers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Stickers

        /**
         String representation of emoji. If empty, returns all known installed stickers
         */
        public let emoji: String

        /**
         Maximum number of stickers to be returned
         */
        public let limit: Int

        /**
         Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is not empty, favorite and recently used stickers may also be returned

         - Parameter emoji: String representation of emoji. If empty, returns all known installed stickers
         - Parameter limit: Maximum number of stickers to be returned
         */
        public init(emoji: String, limit: Int) {
            self.emoji = emoji
            self.limit = limit
        }
    }
}
