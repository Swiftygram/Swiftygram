//
//  GetLocalizationTargetInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization

     - ReturnType: `TDObject.LocalizationTargetInfo`
     */
    struct GetLocalizationTargetInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.LocalizationTargetInfo

        /**
         If true, returns only locally available information without sending network requests
         */
        public let onlyLocal: Bool

        /**
         Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization

         - Parameter onlyLocal: If true, returns only locally available information without sending network requests
         */
        public init(onlyLocal: Bool) {
            self.onlyLocal = onlyLocal
        }
    }
}
