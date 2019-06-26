//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of stickers
     */
    struct Stickers: TDObjectProtocol {
        /**
         List of stickers
         */
        public var stickers: [TDObject.Sticker]

        /**
         Represents a list of stickers

         - Parameter stickers: List of stickers
         */
        public init(stickers: [TDObject.Sticker]) {
            self.stickers = stickers
        }
    }
}
