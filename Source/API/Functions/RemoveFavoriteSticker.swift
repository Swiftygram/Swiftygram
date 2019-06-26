//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a sticker from the list of favorite stickers

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveFavoriteSticker: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Sticker file to delete from the list
         */
        public var sticker: TDEnum.InputFile

        /**
         Removes a sticker from the list of favorite stickers

         - Parameter sticker: Sticker file to delete from the list
         */
        public init(sticker: TDEnum.InputFile) {
            self.sticker = sticker
        }
    }
}
