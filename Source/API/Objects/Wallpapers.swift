//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var wallpapers: [TDObject.Wallpaper]

        /**
         Contains a list of wallpapers

         - Parameter wallpapers: A list of wallpapers
         */
        public init(wallpapers: [TDObject.Wallpaper]) {
            self.wallpapers = wallpapers
        }
    }
}
