//
//  CallbackQueryAnswer.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a bot's answer to a callback query
     */
    struct CallbackQueryAnswer: TDObjectProtocol {
        /**
         Text of the answer
         */
        public let text: String

        /**
         True, if an alert should be shown to the user instead of a toast notification
         */
        public let showAlert: Bool

        /**
         URL to be opened
         */
        public let url: URL

        /**
         Contains a bot's answer to a callback query

         - Parameter text: Text of the answer
         - Parameter showAlert: True, if an alert should be shown to the user instead of a toast notification
         - Parameter url: URL to be opened
         */
        public init(text: String, showAlert: Bool, url: URL) {
            self.text = text
            self.showAlert = showAlert
            self.url = url
        }
    }
}
