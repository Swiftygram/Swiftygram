//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a sticker that should be added to a sticker set
     */
    struct InputSticker: TDObjectProtocol {
        /**
         PNG image with the sticker; must be up to 512 kB in size and fit in a 512x512 square
         */
        public var pngSticker: TDEnum.InputFile

        /**
         Emoji corresponding to the sticker
         */
        public var emojis: String

        /**
         For masks, position where the mask should be placed; may be null
         */
        public var maskPosition: TDObject.MaskPosition?

        /**
         Describes a sticker that should be added to a sticker set

         - Parameter pngSticker: PNG image with the sticker; must be up to 512 kB in size and fit in a 512x512 square
         - Parameter emojis: Emoji corresponding to the sticker
         - Parameter maskPosition: For masks, position where the mask should be placed; may be null
         */
        public init(pngSticker: TDEnum.InputFile, emojis: String, maskPosition: TDObject.MaskPosition?) {
            self.pngSticker = pngSticker
            self.emojis = emojis
            self.maskPosition = maskPosition
        }
    }
}
