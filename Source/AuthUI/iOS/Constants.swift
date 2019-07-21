//
//  Constants.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/17/19.
//

import Foundation

enum Constants {
    static let placeholderColor = UIColor(red: 0.78, green: 0.78, blue: 0.81, alpha: 1.0)
    
    static let separatorColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0)
    
    static let highlightedBackgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    
    static let accentColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
    
    static let separatorSize = 1 / UIScreen.main.scale
    
    static let screenSize: CGSize = {
        let size = UIScreen.main.bounds
        
        return CGSize(width: min(size.width, size.height), height: max(size.width, size.height))
    }()
}
