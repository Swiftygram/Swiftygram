//
//  DispatchQueue.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/9/19.
//

import Foundation

extension DispatchQueue {
    
    func wrap<T>(_ block: @escaping (T) -> ()) -> ((T) -> ()) {
        return { var1 in
//            if self == .main && Thread.isMainThread {
//                block(var1)
//                return
//            }
            
            self.async {
                block(var1)
            }
        }
    }
    
}

class DispatchOnceTimer {
    
    private let timer: DispatchSourceTimer
    
    init(queue: DispatchQueue? = nil, delay: TimeInterval, eventHandler: @escaping () -> ()) {
        timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
        timer.schedule(deadline: .now() + delay)
        
        timer.setEventHandler(handler: eventHandler)
        
        timer.resume()
    }
    
    deinit {
        /*
         If the timer is suspended, calling cancel without resuming
         triggers a crash. This is documented here
         https://forums.developer.apple.com/thread/15902
         */
        timer.cancel()
//        timer.resume()
    }
    
}
