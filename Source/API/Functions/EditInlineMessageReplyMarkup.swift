//
//  EditInlineMessageReplyMarkup.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the reply markup of an inline message sent via a bot; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct EditInlineMessageReplyMarkup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Inline message identifier
         */
        public let inlineMessageId: String

        /**
         The new message reply markup
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         Edits the reply markup of an inline message sent via a bot; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter replyMarkup: The new message reply markup
         */
        public init(inlineMessageId: String, replyMarkup: TDEnum.ReplyMarkup) {
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
        }
    }
}
