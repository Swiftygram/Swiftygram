//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveStickerFromSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Sticker
         */
        public var sticker: TDEnum.InputFile

        /**
         Removes a sticker from the set to which it belongs; for bots only. The sticker set must have been created by the bot

         - Parameter sticker: Sticker
         */
        public init(sticker: TDEnum.InputFile) {
            self.sticker = sticker
        }
    }
}
