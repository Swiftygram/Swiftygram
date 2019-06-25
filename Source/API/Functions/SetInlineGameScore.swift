//
//  SetInlineGameScore.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Updates the game score of the specified user in a game; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct SetInlineGameScore: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Inline message identifier
         */
        public let inlineMessageId: String

        /**
         True, if the message should be edited
         */
        public let editMessage: Bool

        /**
         User identifier
         */
        public let userId: Int

        /**
         The new score
         */
        public let score: Int

        /**
         Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
         */
        public let force: Bool

        /**
         Updates the game score of the specified user in a game; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter editMessage: True, if the message should be edited
         - Parameter userId: User identifier
         - Parameter score: The new score
         - Parameter force: Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
         */
        public init(inlineMessageId: String, editMessage: Bool, userId: Int, score: Int, force: Bool) {
            self.inlineMessageId = inlineMessageId
            self.editMessage = editMessage
            self.userId = userId
            self.score = score
            self.force = force
        }
    }
}
