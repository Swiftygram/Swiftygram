//
//  GetFavoriteStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns favorite stickers

     - ReturnType: `TDObject.Stickers`
     */
    struct GetFavoriteStickers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Stickers

        /**
         Returns favorite stickers
         */
        public init() {}
    }
}
