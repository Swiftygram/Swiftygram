//
//  EditInlineMessageLiveLocation.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the content of a live location in an inline message sent via a bot; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct EditInlineMessageLiveLocation: TDFunctionProtocol {
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
         New location content of the message; may be null. Pass null to stop sharing the live location
         */
        public var location: TDObject.Location

        /**
         Edits the content of a live location in an inline message sent via a bot; for bots only

         - Parameter inlineMessageId: Inline message identifier
         - Parameter replyMarkup: The new message reply markup
         - Parameter location: New location content of the message; may be null. Pass null to stop sharing the live location
         */
        public init(inlineMessageId: String, replyMarkup: TDEnum.ReplyMarkup, location: TDObject.Location) {
            self.inlineMessageId = inlineMessageId
            self.replyMarkup = replyMarkup
            self.location = location
        }
    }
}
