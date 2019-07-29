//
//  WebPageInstantView.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes an instant view page for a web page
     */
    struct WebPageInstantView: TDObjectProtocol {
        /**
         Content of the web page
         */
        public var pageBlocks: [TDEnum.PageBlock]

        /**
         Version of the instant view, currently can be 1 or 2
         */
        public var version: Int

        /**
         Instant view URL; may be different from WebPage.url and must be used for the correct anchors handling
         */
        public var url: URL

        /**
         True, if the instant view must be shown from right to left
         */
        public var isRtl: Bool

        /**
         True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
         */
        public var isFull: Bool

        /**
         Describes an instant view page for a web page

         - Parameter pageBlocks: Content of the web page
         - Parameter version: Version of the instant view, currently can be 1 or 2
         - Parameter url: Instant view URL; may be different from WebPage.url and must be used for the correct anchors handling
         - Parameter isRtl: True, if the instant view must be shown from right to left
         - Parameter isFull: True, if the instant view contains the full page. A network request might be needed to get the full web page instant view
         */
        public init(pageBlocks: [TDEnum.PageBlock], version: Int, url: URL, isRtl: Bool, isFull: Bool) {
            self.pageBlocks = pageBlocks
            self.version = version
            self.url = url
            self.isRtl = isRtl
            self.isFull = isFull
        }
    }
}
