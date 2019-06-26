//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the total number of imported contacts

     - ReturnType: `TDObject.Count`
     */
    struct GetImportedContactCount: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Count

        /**
         Returns the total number of imported contacts
         */
        public init() {}
    }
}
