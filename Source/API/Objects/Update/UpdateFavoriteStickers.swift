//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var stickerIds: [Int]

        /**
         The list of favorite stickers was updated

         - Parameter stickerIds: The new list of file identifiers of favorite stickers
         */
        public init(stickerIds: [Int]) {
            self.stickerIds = stickerIds
        }
    }
}
