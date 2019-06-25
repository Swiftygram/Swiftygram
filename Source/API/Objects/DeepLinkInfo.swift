//
//  DeepLinkInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a tg:// deep link
     */
    struct DeepLinkInfo: TDObjectProtocol {
        /**
         Text to be shown to the user
         */
        public let text: TDObject.FormattedText

        /**
         True, if user should be asked to update the application
         */
        public let needUpdateApplication: Bool

        /**
         Contains information about a tg:// deep link

         - Parameter text: Text to be shown to the user
         - Parameter needUpdateApplication: True, if user should be asked to update the application
         */
        public init(text: TDObject.FormattedText, needUpdateApplication: Bool) {
            self.text = text
            self.needUpdateApplication = needUpdateApplication
        }
    }
}
