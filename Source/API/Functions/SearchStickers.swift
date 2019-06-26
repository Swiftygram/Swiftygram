//
//  SearchStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for stickers from public sticker sets that correspond to a given emoji

     - ReturnType: `TDObject.Stickers`
     */
    struct SearchStickers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Stickers

        /**
         String representation of emoji; must be non-empty
         */
        public let emoji: String

        /**
         Maximum number of stickers to be returned
         */
        public let limit: Int

        /**
         Searches for stickers from public sticker sets that correspond to a given emoji

         - Parameter emoji: String representation of emoji; must be non-empty
         - Parameter limit: Maximum number of stickers to be returned
         */
        public init(emoji: String, limit: Int) {
            self.emoji = emoji
            self.limit = limit
        }
    }
}
