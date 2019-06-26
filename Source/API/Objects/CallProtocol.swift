//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Specifies the supported call protocols
     */
    struct CallProtocol: TDObjectProtocol {
        /**
         True, if UDP peer-to-peer connections are supported
         */
        public var udpP2P: Bool

        /**
         True, if connection through UDP reflectors is supported
         */
        public var udpReflector: Bool

        /**
         Minimum supported API layer; use 65
         */
        public var minLayer: Int

        /**
         Maximum supported API layer; use 65
         */
        public var maxLayer: Int

        /**
         Specifies the supported call protocols

         - Parameter udpP2P: True, if UDP peer-to-peer connections are supported
         - Parameter udpReflector: True, if connection through UDP reflectors is supported
         - Parameter minLayer: Minimum supported API layer; use 65
         - Parameter maxLayer: Maximum supported API layer; use 65
         */
        public init(udpP2P: Bool, udpReflector: Bool, minLayer: Int, maxLayer: Int) {
            self.udpP2P = udpP2P
            self.udpReflector = udpReflector
            self.minLayer = minLayer
            self.maxLayer = maxLayer
        }
    }
}
