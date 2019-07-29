//
//  AddSavedAnimation.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list

     - ReturnType: `TDObject.Ok`
     */
    struct AddSavedAnimation: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The animation file to be added. Only animations known to the server (i.e. successfully sent via a message) can be added to the list
         */
        public var animation: TDEnum.InputFile

        /**
         Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list

         - Parameter animation: The animation file to be added. Only animations known to the server (i.e. successfully sent via a message) can be added to the list
         */
        public init(animation: TDEnum.InputFile) {
            self.animation = animation
        }
    }
}
