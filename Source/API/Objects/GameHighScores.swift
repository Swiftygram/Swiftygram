//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of game high scores
     */
    struct GameHighScores: TDObjectProtocol {
        /**
         A list of game high scores
         */
        public var scores: [TDObject.GameHighScore]

        /**
         Contains a list of game high scores

         - Parameter scores: A list of game high scores
         */
        public init(scores: [TDObject.GameHighScore]) {
            self.scores = scores
        }
    }
}
