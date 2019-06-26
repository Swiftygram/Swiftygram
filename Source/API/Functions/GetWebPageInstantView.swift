//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page

     - ReturnType: `TDObject.WebPageInstantView`
     */
    struct GetWebPageInstantView: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.WebPageInstantView

        /**
         The web page URL
         */
        public var url: URL

        /**
         If true, the full instant view for the web page will be returned
         */
        public var forceFull: Bool

        /**
         Returns an instant view version of a web page if available. Returns a 404 error if the web page has no instant view page

         - Parameter url: The web page URL
         - Parameter forceFull: If true, the full instant view for the web page will be returned
         */
        public init(url: URL, forceFull: Bool) {
            self.url = url
            self.forceFull = forceFull
        }
    }
}
