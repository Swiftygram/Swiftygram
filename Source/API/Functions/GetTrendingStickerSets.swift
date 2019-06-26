//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of trending sticker sets

     - ReturnType: `TDObject.StickerSets`
     */
    struct GetTrendingStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         Returns a list of trending sticker sets
         */
        public init() {}
    }
}
