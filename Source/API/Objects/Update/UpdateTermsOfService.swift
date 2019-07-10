//
//  UpdateTermsOfService.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method should be called with the reason "Decline ToS update"
     */
    struct UpdateTermsOfService: TDObject.Update {
        /**
         Identifier of the terms of service
         */
        public var termsOfServiceId: String

        /**
         The new terms of service
         */
        public var termsOfService: TDObject.TermsOfService

        /**
         New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method should be called with the reason "Decline ToS update"

         - Parameter termsOfServiceId: Identifier of the terms of service
         - Parameter termsOfService: The new terms of service
         */
        public init(termsOfServiceId: String, termsOfService: TDObject.TermsOfService) {
            self.termsOfServiceId = termsOfServiceId
            self.termsOfService = termsOfService
        }
    }
}
