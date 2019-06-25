//
//  PageBlockTableCell.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a cell of a table
     */
    struct PageBlockTableCell: TDObjectProtocol {
        /**
         Cell text
         */
        public let text: TDEnum.RichText

        /**
         True, if it is a header cell
         */
        public let isHeader: Bool

        /**
         The number of columns the cell should span
         */
        public let colspan: Int

        /**
         The number of rows the cell should span
         */
        public let rowspan: Int

        /**
         Horizontal cell content alignment
         */
        public let align: TDEnum.PageBlockHorizontalAlignment

        /**
         Vertical cell content alignment
         */
        public let valign: TDEnum.PageBlockVerticalAlignment

        /**
         Represents a cell of a table

         - Parameter text: Cell text
         - Parameter isHeader: True, if it is a header cell
         - Parameter colspan: The number of columns the cell should span
         - Parameter rowspan: The number of rows the cell should span
         - Parameter align: Horizontal cell content alignment
         - Parameter valign: Vertical cell content alignment
         */
        public init(text: TDEnum.RichText, isHeader: Bool, colspan: Int, rowspan: Int, align: TDEnum.PageBlockHorizontalAlignment, valign: TDEnum.PageBlockVerticalAlignment) {
            self.text = text
            self.isHeader = isHeader
            self.colspan = colspan
            self.rowspan = rowspan
            self.align = align
            self.valign = valign
        }
    }
}
