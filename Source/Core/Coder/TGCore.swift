//
//  TGCore.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/26/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public typealias TGCompletableResultHandler = (TGCompletableResult) -> ()

public enum TGCompletableResult {
    
    case data(Data)
    case failure(Error)
    
}

public enum TGResult<T> {
    
    case success(object: T)
    case failure(Error)
    
}
