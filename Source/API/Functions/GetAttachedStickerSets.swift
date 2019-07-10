//
//  GetAttachedStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets

     - ReturnType: `TDObject.StickerSets`
     */
    struct GetAttachedStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         File identifier
         */
        public var fileId: Int

        /**
         Returns a list of sticker sets attached to a file. Currently only photos and videos can have attached sticker sets

         - Parameter fileId: File identifier
         */
        public init(fileId: Int) {
            self.fileId = fileId
        }
    }
}
