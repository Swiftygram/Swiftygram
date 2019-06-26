//
//  EditInlineMessageMedia.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct EditInlineMessageMedia: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Inline message identifier
         */
        public let inlineMessageId: String

        /**
         The new message reply markup; for bots only
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         New content of the message. Must be one of the following types: InputMessageAnimation, InputMessageAudio, InputMessageDocument, InputMessagePhoto or InputMessageVideo
         */
        public let inputMessageContent: TDEnum.InputMessageContent

        /**
         Edits the content of a message with an animation, an audio, a document, a photo or a video in an inline message sent via a bot; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter replyMarkup: The new message reply markup; for bots only
         - Parameter inputMessageContent: New content of the message. Must be one of the following types: InputMessageAnimation, InputMessageAudio, InputMessageDocument, InputMessagePhoto or InputMessageVideo
         */
        public init(inlineMessageId: String, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent) {
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
            self.inputMessageContent = inputMessageContent
        }
    }
}
