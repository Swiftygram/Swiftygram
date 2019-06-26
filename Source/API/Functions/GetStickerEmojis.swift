//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns emoji corresponding to a sticker

     - ReturnType: `TDObject.StickerEmojis`
     */
    struct GetStickerEmojis: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerEmojis

        /**
         Sticker file identifier
         */
        public var sticker: TDEnum.InputFile

        /**
         Returns emoji corresponding to a sticker

         - Parameter sticker: Sticker file identifier
         */
        public init(sticker: TDEnum.InputFile) {
            self.sticker = sticker
        }
    }
}
