//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The list of trending sticker sets was updated or some of them were viewed
     */
    struct UpdateTrendingStickerSets: TDObject.Update {
        /**
         The new list of trending sticker sets
         */
        public var stickerSets: TDObject.StickerSets

        /**
         The list of trending sticker sets was updated or some of them were viewed

         - Parameter stickerSets: The new list of trending sticker sets
         */
        public init(stickerSets: TDObject.StickerSets) {
            self.stickerSets = stickerSets
        }
    }
}
