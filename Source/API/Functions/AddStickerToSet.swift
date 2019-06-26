//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a new sticker to a set; for bots only. Returns the sticker set

     - ReturnType: `TDObject.StickerSet`
     */
    struct AddStickerToSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSet

        /**
         Sticker set owner
         */
        public var userId: Int

        /**
         Sticker set name
         */
        public var name: String

        /**
         Sticker to add to the set
         */
        public var sticker: TDObject.InputSticker

        /**
         Adds a new sticker to a set; for bots only. Returns the sticker set

         - Parameter userId: Sticker set owner
         - Parameter name: Sticker set name
         - Parameter sticker: Sticker to add to the set
         */
        public init(userId: Int, name: String, sticker: TDObject.InputSticker) {
            self.userId = userId
            self.name = name
            self.sticker = sticker
        }
    }
}
