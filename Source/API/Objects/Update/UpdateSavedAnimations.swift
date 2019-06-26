//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The list of saved animations was updated
     */
    struct UpdateSavedAnimations: TDObject.Update {
        /**
         The new list of file identifiers of saved animations
         */
        public var animationIds: [Int]

        /**
         The list of saved animations was updated

         - Parameter animationIds: The new list of file identifiers of saved animations
         */
        public init(animationIds: [Int]) {
            self.animationIds = animationIds
        }
    }
}
