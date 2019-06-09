//
//  Utils.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/30/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension String {
    
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func regExMatches(with pattern: String, options: NSRegularExpression.Options = []) -> [[String]] {
        let regEx = try! NSRegularExpression(pattern: pattern, options: options)
        let nsString = self as NSString
        
        return regEx.matches(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)).lazy.map({ result -> [String] in
            return (0..<result.numberOfRanges).map({
                nsString.substring(with: result.range(at: $0))
            })
        })
    }
    
    var uppercasedFirstLetter: String {
        return String(first!).uppercased() + dropFirst()
    }
    
    var lowercasedFirstLetter: String {
        return String(first!).lowercased() + dropFirst()
    }
    
    var isUppercase: Bool {
        return uppercased() == self
    }
    
}
