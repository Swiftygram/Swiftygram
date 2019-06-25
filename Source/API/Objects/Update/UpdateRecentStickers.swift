//
//  UpdateRecentStickers.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The list of recently used stickers was updated
     */
    struct UpdateRecentStickers: TDObject.Update {
        /**
         True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated
         */
        public let isAttached: Bool

        /**
         The new list of file identifiers of recently used stickers
         */
        public let stickerIds: [Int]

        /**
         The list of recently used stickers was updated

         - Parameter isAttached: True, if the list of stickers attached to photo or video files was updated, otherwise the list of sent stickers is updated
         - Parameter stickerIds: The new list of file identifiers of recently used stickers
         */
        public init(isAttached: Bool, stickerIds: [Int]) {
            self.isAttached = isAttached
            self.stickerIds = stickerIds
        }
    }
}
