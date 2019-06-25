//
//  GetInviteText.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the default text for invitation messages to be used as a placeholder when the current user invites friends to Telegram

     - ReturnType: `TDObject.Text`
     */
    struct GetInviteText: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         Returns the default text for invitation messages to be used as a placeholder when the current user invites friends to Telegram
         */
        public init() {}
    }
}
