//
//  SearchStickerSet.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for a sticker set by its name

     - ReturnType: `TDObject.StickerSet`
     */
    struct SearchStickerSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSet

        /**
         Name of the sticker set
         */
        public var name: String

        /**
         Searches for a sticker set by its name

         - Parameter name: Name of the sticker set
         */
        public init(name: String) {
            self.name = name
        }
    }
}
