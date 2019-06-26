//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a part of a file
     */
    struct FilePart: TDObjectProtocol {
        /**
         File bytes
         */
        public var data: String

        /**
         Contains a part of a file

         - Parameter data: File bytes
         */
        public init(data: String) {
            self.data = data
        }
    }
}
