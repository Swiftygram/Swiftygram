//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var onlyLocal: Bool

        /**
         Returns information about the current localization target. This is an offline request if only_local is true. Can be called before authorization

         - Parameter onlyLocal: If true, returns only locally available information without sending network requests
         */
        public init(onlyLocal: Bool) {
            self.onlyLocal = onlyLocal
        }
    }
}
