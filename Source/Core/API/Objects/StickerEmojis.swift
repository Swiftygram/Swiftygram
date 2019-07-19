//
//  StickerEmojis.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of all emoji corresponding to a sticker in a sticker set. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object
     */
    struct StickerEmojis: TDObjectProtocol {
        /**
         List of emojis
         */
        public var emojis: [String]

        /**
         Represents a list of all emoji corresponding to a sticker in a sticker set. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object

         - Parameter emojis: List of emojis
         */
        public init(emojis: [String]) {
            self.emojis = emojis
        }
    }
}
