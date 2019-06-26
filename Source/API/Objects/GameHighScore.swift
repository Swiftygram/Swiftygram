//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains one row of the game high score table
     */
    struct GameHighScore: TDObjectProtocol {
        /**
         Position in the high score table
         */
        public var position: Int

        /**
         User identifier
         */
        public var userId: Int

        /**
         User score
         */
        public var score: Int

        /**
         Contains one row of the game high score table

         - Parameter position: Position in the high score table
         - Parameter userId: User identifier
         - Parameter score: User score
         */
        public init(position: Int, userId: Int, score: Int) {
            self.position = position
            self.userId = userId
            self.score = score
        }
    }
}
