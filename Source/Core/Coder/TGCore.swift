//
//  TGCore.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/26/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

typealias TDDataResultHandler = (TDDataResult) -> ()

public typealias TDResultHandler<T: TDObjectProtocol> = (TDResult<T>) -> ()

enum TDDataResult {
    
    case success(Data)
    case failure(TDError)
    
}

public enum TDResult<T: TDObjectProtocol> {
    
    case success(T)
    case failure(TDError)
    
}
