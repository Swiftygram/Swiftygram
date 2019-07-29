//
//  RemoveRecentSticker.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a sticker from the list of recently used stickers

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveRecentSticker: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
         */
        public var isAttached: Bool

        /**
         Sticker file to delete
         */
        public var sticker: TDEnum.InputFile

        /**
         Removes a sticker from the list of recently used stickers

         - Parameter isAttached: Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
         - Parameter sticker: Sticker file to delete
         */
        public init(isAttached: Bool, sticker: TDEnum.InputFile) {
            self.isAttached = isAttached
            self.sticker = sticker
        }
    }
}
