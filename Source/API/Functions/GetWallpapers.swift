//
//  GetWallpapers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns background wallpapers

     - ReturnType: `TDObject.Wallpapers`
     */
    struct GetWallpapers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Wallpapers

        /**
         Returns background wallpapers
         */
        public init() {}
    }
}
