//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     New call was created or information about a call was updated
     */
    struct UpdateCall: TDObject.Update {
        /**
         New data about a call
         */
        public var call: TDObject.Call

        /**
         New call was created or information about a call was updated

         - Parameter call: New data about a call
         */
        public init(call: TDObject.Call) {
            self.call = call
        }
    }
}
