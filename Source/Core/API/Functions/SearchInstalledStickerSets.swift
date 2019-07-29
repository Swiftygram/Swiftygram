//
//  SearchInstalledStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for installed sticker sets by looking for specified query in their title and name

     - ReturnType: `TDObject.StickerSets`
     */
    struct SearchInstalledStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         Pass true to return mask sticker sets; pass false to return ordinary sticker sets
         */
        public var isMasks: Bool

        /**
         Query to search for
         */
        public var query: String

        /**
         Maximum number of sticker sets to return
         */
        public var limit: Int

        /**
         Searches for installed sticker sets by looking for specified query in their title and name

         - Parameter isMasks: Pass true to return mask sticker sets; pass false to return ordinary sticker sets
         - Parameter query: Query to search for
         - Parameter limit: Maximum number of sticker sets to return
         */
        public init(isMasks: Bool, query: String, limit: Int) {
            self.isMasks = isMasks
            self.query = query
            self.limit = limit
        }
    }
}
