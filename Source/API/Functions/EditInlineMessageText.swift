//
//  EditInlineMessageText.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the text of an inline text or game message sent via a bot; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct EditInlineMessageText: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Inline message identifier
         */
        public var inlineMessageId: String

        /**
         The new message reply markup
         */
        public var replyMarkup: TDEnum.ReplyMarkup

        /**
         New text content of the message. Should be of type InputMessageText
         */
        public var inputMessageContent: TDEnum.InputMessageContent

        /**
         Edits the text of an inline text or game message sent via a bot; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter replyMarkup: The new message reply markup
         - Parameter inputMessageContent: New text content of the message. Should be of type InputMessageText
         */
        public init(inlineMessageId: String, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent) {
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
            self.inputMessageContent = inputMessageContent
        }
    }
}
