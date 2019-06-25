//
//  UpdateNewChosenInlineResult.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The user has chosen a result of an inline query; for bots only
     */
    struct UpdateNewChosenInlineResult: TDObject.Update {
        /**
         Identifier of the user who sent the query
         */
        public let senderUserId: Int

        /**
         User location, provided by the client; may be null
         */
        public let userLocation: TDObject.Location

        /**
         Text of the query
         */
        public let query: String

        /**
         Identifier of the chosen result
         */
        public let resultId: String

        /**
         Identifier of the sent inline message, if known
         */
        public let inlineMessageId: String

        /**
         The user has chosen a result of an inline query; for bots only

         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter userLocation: User location, provided by the client; may be null
         - Parameter query: Text of the query
         - Parameter resultId: Identifier of the chosen result
         - Parameter inlineMessageId: Identifier of the sent inline message, if known
         */
        public init(senderUserId: Int, userLocation: TDObject.Location, query: String, resultId: String, inlineMessageId: String) {
            self.senderUserId = senderUserId
            self.userLocation = userLocation
            self.query = query
            self.resultId = resultId
            self.inlineMessageId = inlineMessageId
        }
    }
}
