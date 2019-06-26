//
//  EditInlineMessageCaption.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the caption of an inline message sent via a bot; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct EditInlineMessageCaption: TDFunctionProtocol {
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
         New message content caption; 0-GetOption("message_caption_length_max") characters
         */
        public let caption: TDObject.FormattedText

        /**
         Edits the caption of an inline message sent via a bot; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter replyMarkup: The new message reply markup
         - Parameter caption: New message content caption; 0-GetOption("message_caption_length_max") characters
         */
        public init(inlineMessageId: String, replyMarkup: TDEnum.ReplyMarkup, caption: TDObject.FormattedText) {
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
            self.caption = caption
        }
    }
}
