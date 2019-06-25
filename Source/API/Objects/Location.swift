//
//  Location.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a location on planet Earth
     */
    struct Location: TDObjectProtocol {
        /**
         Latitude of the location in degrees; as defined by the sender
         */
        public let latitude: Double

        /**
         Longitude of the location, in degrees; as defined by the sender
         */
        public let longitude: Double

        /**
         Describes a location on planet Earth

         - Parameter latitude: Latitude of the location in degrees; as defined by the sender
         - Parameter longitude: Longitude of the location, in degrees; as defined by the sender
         */
        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
