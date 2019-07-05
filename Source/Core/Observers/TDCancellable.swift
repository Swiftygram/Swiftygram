//
//  TDObservation.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 6/26/19.
//

import Foundation

final public class TDCancellable {
    
    private let lock = MutexLock()
    private var cancelBlock: (() -> ())?
    
    init(cancelBlock: @escaping () -> ()) {
        self.cancelBlock = cancelBlock
    }
    
    deinit {
        cancel()
    }
    
    /**
     cancel() will be called automatically when an TDObservation is deinited
     */
    public func cancel() {
        lock.lock()
        
        let cancelBlock = self.cancelBlock
        self.cancelBlock = nil
        
        lock.unlock()
        
        cancelBlock?()
    }
    
}
