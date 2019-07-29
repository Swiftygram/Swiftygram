//
//  PageBlockCaption.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var text: TDEnum.RichText

        /**
         Block credit (like HTML tag <cite>)
         */
        public var credit: TDEnum.RichText

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
