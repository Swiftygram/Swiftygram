//
//  Date.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a date according to the Gregorian calendar
     */
    struct Date: TDObjectProtocol {
        /**
         Day of the month, 1-31
         */
        public var day: Int

        /**
         Month, 1-12
         */
        public var month: Int

        /**
         Year, 1-9999
         */
        public var year: Int

        /**
         Represents a date according to the Gregorian calendar

         - Parameter day: Day of the month, 1-31
         - Parameter month: Month, 1-12
         - Parameter year: Year, 1-9999
         */
        public init(day: Int, month: Int, year: Int) {
            self.day = day
            self.month = month
            self.year = year
        }
    }
}
