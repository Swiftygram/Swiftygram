//
//  TDError.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 6/26/19.
//

import Foundation

public enum TDError: Error {
    case tdLib(TDObject.Error)
    case timedOut
    case internalInconsistency(Error)
    case cancelled
}
