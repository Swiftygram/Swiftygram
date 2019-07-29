//
//  RemoveSavedAnimation.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes an animation from the list of saved animations

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveSavedAnimation: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Animation file to be removed
         */
        public var animation: TDEnum.InputFile

        /**
         Removes an animation from the list of saved animations

         - Parameter animation: Animation file to be removed
         */
        public init(animation: TDEnum.InputFile) {
            self.animation = animation
        }
    }
}
