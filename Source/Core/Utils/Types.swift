//
//  TGCore.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/26/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

// MARK: - Internal types

typealias TDDataResultHandler = (TDDataResult) -> ()

typealias UpdateHandler = (TDObject.Update) -> ()

typealias UpdateObserverInfo = (nextId: UInt64, handlers: [UInt64: UpdateHandler])

typealias PendingFunction = (TDClient, UInt64?) -> ()

enum TDDataResult {
    
    case success(Data)
    case failure(TDError)
    
}

// MARK: - Public types

public typealias TDResultHandler<T: TDObjectProtocol> = (TDResult<T>) -> ()

public enum TDResult<T: TDObjectProtocol> {
    
    case success(T)
    case failure(TDError)
    
}

public enum TDAuthorizationResult {
    
    case success(TDAuthorization)
    case failure(TDAuthorizationError)
    
}

public typealias TDAuthorizationResultHandler = (TDAuthorizationResult) -> ()
