//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot

     - ReturnType: `TDObject.Ok`
     */
    struct SetStickerPositionInSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Sticker
         */
        public var sticker: TDEnum.InputFile

        /**
         New position of the sticker in the set, zero-based
         */
        public var position: Int

        /**
         Changes the position of a sticker in the set to which it belongs; for bots only. The sticker set must have been created by the bot

         - Parameter sticker: Sticker
         - Parameter position: New position of the sticker in the set, zero-based
         */
        public init(sticker: TDEnum.InputFile, position: Int) {
            self.sticker = sticker
            self.position = position
        }
    }
}
