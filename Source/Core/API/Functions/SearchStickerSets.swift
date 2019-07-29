//
//  SearchStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results

     - ReturnType: `TDObject.StickerSets`
     */
    struct SearchStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         Query to search for
         */
        public var query: String

        /**
         Searches for ordinary sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results

         - Parameter query: Query to search for
         */
        public init(query: String) {
            self.query = query
        }
    }
}
