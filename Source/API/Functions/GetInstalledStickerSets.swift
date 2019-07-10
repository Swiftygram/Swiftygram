//
//  GetInstalledStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of installed sticker sets

     - ReturnType: `TDObject.StickerSets`
     */
    struct GetInstalledStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         Pass true to return mask sticker sets; pass false to return ordinary sticker sets
         */
        public var isMasks: Bool

        /**
         Returns a list of installed sticker sets

         - Parameter isMasks: Pass true to return mask sticker sets; pass false to return ordinary sticker sets
         */
        public init(isMasks: Bool) {
            self.isMasks = isMasks
        }
    }
}
