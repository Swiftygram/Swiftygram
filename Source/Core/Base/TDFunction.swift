//
//  TDFunction.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/24/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

/// Functions namespace
public class TDFunction {}

/// Base protocol for all functions
public protocol TDFunctionProtocol: TDObjectProtocol {
    associatedtype ReturnType: TDObjectProtocol
}
