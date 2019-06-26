//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new sticker set; for bots only. Returns the newly created sticker set

     - ReturnType: `TDObject.StickerSet`
     */
    struct CreateNewStickerSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSet

        /**
         Sticker set owner
         */
        public var userId: Int

        /**
         Sticker set title; 1-64 characters
         */
        public var title: String

        /**
         Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters
         */
        public var name: String

        /**
         True, if stickers are masks
         */
        public var isMasks: Bool

        /**
         List of stickers to be added to the set
         */
        public var stickers: [TDObject.InputSticker]

        /**
         Creates a new sticker set; for bots only. Returns the newly created sticker set

         - Parameter userId: Sticker set owner
         - Parameter title: Sticker set title; 1-64 characters
         - Parameter name: Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_<bot username>"* (*<bot_username>* is case insensitive); 1-64 characters
         - Parameter isMasks: True, if stickers are masks
         - Parameter stickers: List of stickers to be added to the set
         */
        public init(userId: Int, title: String, name: String, isMasks: Bool, stickers: [TDObject.InputSticker]) {
            self.userId = userId
            self.title = title
            self.name = name
            self.isMasks = isMasks
            self.stickers = stickers
        }
    }
}
