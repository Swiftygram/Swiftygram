//
//  TDSubject.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

public final class TDSubject<Element> {
    
    public typealias Observer = (Element, Element?) -> Void
    
    private var observers: [Int: (Observer, DispatchQueue?)] = [:]
    private var uniqueID = (0...).makeIterator()
    
    private let lock = MutexLock()
    
    private var _value: Element {
        didSet {
            let newValue = _value
            observers.values.forEach { observer, dispatchQueue in
                if let dispatchQueue = dispatchQueue {
                    // main thread optimization
                    if dispatchQueue == .main, Thread.isMainThread {
                        observer(newValue, oldValue)
                        return
                    }
                    
                    dispatchQueue.async {
                        observer(newValue, oldValue)
                    }
                } else {
                    observer(newValue, oldValue)
                }
            }
        }
    }
    
    public internal(set) var value: Element {
        get {
            return _value
        }
        set {
            lock.lock(); defer { lock.unlock() }
            
            _value = newValue
        }
    }
    
    public init(_ value: Element) {
        self._value = value
    }
    
    public func observe(_ queue: DispatchQueue? = nil, _ observer: @escaping Observer) -> TDCancellable {
        lock.lock(); defer { lock.unlock() }
        
        let id = uniqueID.next()!
        
        observers[id] = (observer, queue)
        observer(value, nil)
        
        return TDCancellable { [weak self] in
            guard let self = self else { return }
            
            self.lock.lock(); defer { self.lock.unlock() }
            
            self.observers[id] = nil
        }
    }
    
}
