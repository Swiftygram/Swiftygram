//
//  PageBlockCaption.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a caption of an instant view web page block, consisting of a text and a trailing credit
     */
    struct PageBlockCaption: TDObjectProtocol {
        /**
         Content of the caption
         */
        public let text: TDEnum.RichText

        /**
         Block credit (like HTML tag <cite>)
         */
        public let credit: TDEnum.RichText

        /**
         Contains a caption of an instant view web page block, consisting of a text and a trailing credit

         - Parameter text: Content of the caption
         - Parameter credit: Block credit (like HTML tag <cite>)
         */
        public init(text: TDEnum.RichText, credit: TDEnum.RichText) {
            self.text = text
            self.credit = credit
        }
    }
}
