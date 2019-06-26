//
//  Venue.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a venue
     */
    struct Venue: TDObjectProtocol {
        /**
         Venue location; as defined by the sender
         */
        public let location: TDObject.Location

        /**
         Venue name; as defined by the sender
         */
        public let title: String

        /**
         Venue address; as defined by the sender
         */
        public let address: String

        /**
         Provider of the venue database; as defined by the sender. Currently only "foursquare" needs to be supported
         */
        public let provider: String

        /**
         Identifier of the venue in the provider database; as defined by the sender
         */
        public let id: String

        /**
         Type of the venue in the provider database; as defined by the sender
         */
        public let type: String

        /**
         Describes a venue

         - Parameter location: Venue location; as defined by the sender
         - Parameter title: Venue name; as defined by the sender
         - Parameter address: Venue address; as defined by the sender
         - Parameter provider: Provider of the venue database; as defined by the sender. Currently only "foursquare" needs to be supported
         - Parameter id: Identifier of the venue in the provider database; as defined by the sender
         - Parameter type: Type of the venue in the provider database; as defined by the sender
         */
        public init(location: TDObject.Location, title: String, address: String, provider: String, id: String, type: String) {
            self.location = location
            self.title = title
            self.address = address
            self.provider = provider
            self.id = id
            self.type = type
        }
    }
}
