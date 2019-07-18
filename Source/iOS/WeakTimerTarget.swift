//
//  WeakTimerTarget.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/18/19.
//

import Foundation

class WeakTimerTarget {
    private weak var target: AnyObject?
    private let selector: Selector
    
    init(target: AnyObject, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    @objc func timerFired(_ timer: Timer) {
        if let target = target {
            _ = target.perform(selector, with: timer)
        } else {
            timer.invalidate()
        }
    }
}
