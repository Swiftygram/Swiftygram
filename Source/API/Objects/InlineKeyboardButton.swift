//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a single button in an inline keyboard
     */
    struct InlineKeyboardButton: TDObjectProtocol {
        /**
         Text of the button
         */
        public var text: String

        /**
         Type of the button
         */
        public var type: TDEnum.InlineKeyboardButtonType

        /**
         Represents a single button in an inline keyboard

         - Parameter text: Text of the button
         - Parameter type: Type of the button
         */
        public init(text: String, type: TDEnum.InlineKeyboardButtonType) {
            self.text = text
            self.type = type
        }
    }
}
