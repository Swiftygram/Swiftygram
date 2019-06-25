//
//  MaskPosition.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Position on a photo where a mask should be placed
     */
    struct MaskPosition: TDObjectProtocol {
        /**
         Part of the face, relative to which the mask should be placed
         */
        public let point: TDEnum.MaskPoint

        /**
         Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
         */
        public let xShift: Double

        /**
         Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
         */
        public let yShift: Double

        /**
         Mask scaling coefficient. (For example, 2.0 means a doubled size)
         */
        public let scale: Double

        /**
         Position on a photo where a mask should be placed

         - Parameter point: Part of the face, relative to which the mask should be placed
         - Parameter xShift: Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
         - Parameter yShift: Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
         - Parameter scale: Mask scaling coefficient. (For example, 2.0 means a doubled size)
         */
        public init(point: TDEnum.MaskPoint, xShift: Double, yShift: Double, scale: Double) {
            self.point = point
            self.xShift = xShift
            self.yShift = yShift
            self.scale = scale
        }
    }
}
