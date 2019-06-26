//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns game high scores and some part of the high score table in the range of the specified user; for bots only

     - ReturnType: `TDObject.GameHighScores`
     */
    struct GetInlineGameHighScores: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.GameHighScores

        /**
         Inline message identifier
         */
        public var inlineMessageId: String

        /**
         User identifier
         */
        public var userId: Int

        /**
         Returns game high scores and some part of the high score table in the range of the specified user; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter userId: User identifier
         */
        public init(inlineMessageId: String, userId: Int) {
            self.inlineMessageId = inlineMessageId
            self.userId = userId
        }
    }
}
