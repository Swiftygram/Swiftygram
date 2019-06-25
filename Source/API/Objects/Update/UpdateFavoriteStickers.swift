//
//  UpdateFavoriteStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The list of favorite stickers was updated
     */
    struct UpdateFavoriteStickers: TDObject.Update {
        /**
         The new list of file identifiers of favorite stickers
         */
        public let stickerIds: [Int]

        /**
         The list of favorite stickers was updated

         - Parameter stickerIds: The new list of file identifiers of favorite stickers
         */
        public init(stickerIds: [Int]) {
            self.stickerIds = stickerIds
        }
    }
}
