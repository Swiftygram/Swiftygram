//
//  Mutex.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

final class MutexLock {
    
    private var mutex: pthread_mutex_t = {
        var mutex = pthread_mutex_t()
        pthread_mutex_init(&mutex, nil)
        return mutex
    }()
    
    deinit {
        pthread_mutex_destroy(&mutex)
    }
    
    func lock() {
        pthread_mutex_lock(&mutex)
    }
    
    func unlock() {
        pthread_mutex_unlock(&mutex)
    }
    
}
