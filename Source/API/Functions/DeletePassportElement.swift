//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes a Telegram Passport element

     - ReturnType: `TDObject.Ok`
     */
    struct DeletePassportElement: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Element type
         */
        public var type: TDEnum.PassportElementType

        /**
         Deletes a Telegram Passport element

         - Parameter type: Element type
         */
        public init(type: TDEnum.PassportElementType) {
            self.type = type
        }
    }
}
