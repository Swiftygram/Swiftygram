//
//  TGFunction.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/24/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public typealias TGFunctionProtocol<ResponseType: TGObjectProtocol> = __TGFunction<ResponseType> & TGBaseObjectProtocol & Codable

public typealias TGCompletableFunctionProtocol = TGFunctionProtocol<TGObject.Ok>

open class __TGFunction<T: TGObjectProtocol>: TGBaseObject {
    
    typealias ResponseType = T
    
}

// Namespace
public class TGFunction {
    
}
