//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a single button in a bot keyboard
     */
    struct KeyboardButton: TDObjectProtocol {
        /**
         Text of the button
         */
        public var text: String

        /**
         Type of the button
         */
        public var type: TDEnum.KeyboardButtonType

        /**
         Represents a single button in a bot keyboard

         - Parameter text: Text of the button
         - Parameter type: Type of the button
         */
        public init(text: String, type: TDEnum.KeyboardButtonType) {
            self.text = text
            self.type = type
        }
    }
}
