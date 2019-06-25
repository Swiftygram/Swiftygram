//
//  UploadStickerFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Uploads a PNG image with a sticker; for bots only; returns the uploaded file

     - ReturnType: `TDObject.File`
     */
    struct UploadStickerFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         Sticker file owner
         */
        public let userId: Int

        /**
         PNG image with the sticker; must be up to 512 kB in size and fit in 512x512 square
         */
        public let pngSticker: TDEnum.InputFile

        /**
         Uploads a PNG image with a sticker; for bots only; returns the uploaded file

         - Parameter userId: Sticker file owner
         - Parameter pngSticker: PNG image with the sticker; must be up to 512 kB in size and fit in 512x512 square
         */
        public init(userId: Int, pngSticker: TDEnum.InputFile) {
            self.userId = userId
            self.pngSticker = pngSticker
        }
    }
}
