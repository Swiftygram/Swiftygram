//
//  Wallpapers.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of wallpapers
     */
    struct Wallpapers: TDObjectProtocol {
        /**
         A list of wallpapers
         */
        public let wallpapers: [TDObject.Wallpaper]

        /**
         Contains a list of wallpapers

         - Parameter wallpapers: A list of wallpapers
         */
        public init(wallpapers: [TDObject.Wallpaper]) {
            self.wallpapers = wallpapers
        }
    }
}
