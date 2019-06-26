//
//  TDObservation.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 6/26/19.
//

import Foundation

final public class TDObservation {
    
    static let payload = "payload"
    
    private weak var notificationCenter: NotificationCenter?
    private let notificationHandler: (Any) -> ()
    
    init(notificationCenter: NotificationCenter, name: NSNotification.Name, notificationHandler: @escaping (Any) -> ()) {
        self.notificationCenter = notificationCenter
        self.notificationHandler = notificationHandler
        
        notificationCenter.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: name, object: nil)
    }
    
    deinit {
        invalidate()
    }
    
    /**
     invalidate() will be called automatically when an TDObservation is deinited
     */
    public func invalidate() {
        notificationCenter?.removeObserver(self)
    }
    
    @objc private func didReceiveNotification(_ notification: Notification) {
        if let payload = notification.userInfo?[TDObservation.payload] {
            notificationHandler(payload)
        }
    }
    
}
