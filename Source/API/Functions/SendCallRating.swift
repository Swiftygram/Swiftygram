//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a call rating

     - ReturnType: `TDObject.Ok`
     */
    struct SendCallRating: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Call identifier
         */
        public var callId: Int

        /**
         Call rating; 1-5
         */
        public var rating: Int

        /**
         An optional user comment if the rating is less than 5
         */
        public var comment: String

        /**
         Sends a call rating

         - Parameter callId: Call identifier
         - Parameter rating: Call rating; 1-5
         - Parameter comment: An optional user comment if the rating is less than 5
         */
        public init(callId: Int, rating: Int, comment: String) {
            self.callId = callId
            self.rating = rating
            self.comment = comment
        }
    }
}
