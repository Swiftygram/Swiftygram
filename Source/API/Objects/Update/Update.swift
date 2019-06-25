//
//  Update.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains notifications about data changes
     */
    typealias Update = __Update
}

public protocol __Update: TDObjectProtocol {}
