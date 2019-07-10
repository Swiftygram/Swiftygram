//
//  GetDeepLinkInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization

     - ReturnType: `TDObject.DeepLinkInfo`
     */
    struct GetDeepLinkInfo: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.DeepLinkInfo

        /**
         The link
         */
        public var link: String

        /**
         Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization

         - Parameter link: The link
         */
        public init(link: String) {
            self.link = link
        }
    }
}
