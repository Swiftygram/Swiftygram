//
//  GameHighScore.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
        public let position: Int

        /**
         User identifier
         */
        public let userId: Int

        /**
         User score
         */
        public let score: Int

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
