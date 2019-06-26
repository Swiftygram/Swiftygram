//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list

     - ReturnType: `TDObject.Ok`
     */
    struct AddFavoriteSticker: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Sticker file to add
         */
        public var sticker: TDEnum.InputFile

        /**
         Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first. Only stickers belonging to a sticker set can be added to this list

         - Parameter sticker: Sticker file to add
         */
        public init(sticker: TDEnum.InputFile) {
            self.sticker = sticker
        }
    }
}
