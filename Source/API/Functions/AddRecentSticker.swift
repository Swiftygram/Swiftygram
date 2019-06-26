//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list

     - ReturnType: `TDObject.Stickers`
     */
    struct AddRecentSticker: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Stickers

        /**
         Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
         */
        public var isAttached: Bool

        /**
         Sticker file to add
         */
        public var sticker: TDEnum.InputFile

        /**
         Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list

         - Parameter isAttached: Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
         - Parameter sticker: Sticker file to add
         */
        public init(isAttached: Bool, sticker: TDEnum.InputFile) {
            self.isAttached = isAttached
            self.sticker = sticker
        }
    }
}
