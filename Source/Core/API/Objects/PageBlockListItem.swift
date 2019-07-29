//
//  PageBlockListItem.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes an item of a list page block
     */
    struct PageBlockListItem: TDObjectProtocol {
        /**
         Item label
         */
        public var label: String

        /**
         Item blocks
         */
        public var pageBlocks: [TDEnum.PageBlock]

        /**
         Describes an item of a list page block

         - Parameter label: Item label
         - Parameter pageBlocks: Item blocks
         */
        public init(label: String, pageBlocks: [TDEnum.PageBlock]) {
            self.label = label
            self.pageBlocks = pageBlocks
        }
    }
}
