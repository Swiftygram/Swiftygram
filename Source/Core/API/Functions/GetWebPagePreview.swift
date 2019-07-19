//
//  GetWebPagePreview.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview

     - ReturnType: `TDObject.WebPage`
     */
    struct GetWebPagePreview: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.WebPage

        /**
         Message text with formatting
         */
        public var text: TDObject.FormattedText

        /**
         Returns a web page preview by the text of the message. Do not call this function too often. Returns a 404 error if the web page has no preview

         - Parameter text: Message text with formatting
         */
        public init(text: TDObject.FormattedText) {
            self.text = text
        }
    }
}
