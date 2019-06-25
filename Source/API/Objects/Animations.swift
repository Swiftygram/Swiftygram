//
//  Animations.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of animations
     */
    struct Animations: TDObjectProtocol {
        /**
         List of animations
         */
        public let animations: [TDObject.Animation]

        /**
         Represents a list of animations

         - Parameter animations: List of animations
         */
        public init(animations: [TDObject.Animation]) {
            self.animations = animations
        }
    }
}
