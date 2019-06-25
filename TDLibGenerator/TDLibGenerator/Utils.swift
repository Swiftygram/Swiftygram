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

    func sharedPrefix(with other: String) -> String {
        return (self.isEmpty || other.isEmpty || self.first! != other.first!) ? "" :
            "\(self.first!)" + String(Array(self.dropFirst())).sharedPrefix(with: String(Array(other.dropFirst())))
    }
    
    // https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html
    var swiftEscapedIfNeeded: String {
        let reservedWords = [
            "associatedtype",
            "class",
            "deinit",
            "enum",
            "extension",
            "fileprivate",
            "func",
            "import",
            "init",
            "inout",
            "internal",
            "let",
            "open",
            "operator",
            "private",
            "protocol",
            "public",
            "static",
            "struct",
            "subscript",
            "typealias",
            "var",
            "break",
            "case",
            "continue",
            "default",
            "defer",
            "do",
            "else",
            "fallthrough",
            "for",
            "guard",
            "if",
            "in",
            "repeat",
            "return",
            "switch",
            "where",
            "while"
        ]
        
        return reservedWords.contains(self) ? "`\(self)`" : self
    }
    
    func breakLines(with maxLength: Int) -> [String] {
        var lines = [String]()
        var line = ""
        
        for word in components(separatedBy: " ") {
            let tempLine = "\(line) \(word)"
            
            if tempLine.count > maxLength {
                if line.isEmpty {
                    lines.append(tempLine)
                    line = ""
                } else {
                    lines.append(line)
                    line = word
                }
            } else {
                line = tempLine
            }
        }
        
        if !line.isEmpty || lines.isEmpty {
            lines.append(line)
        }
        
        return lines
    }
    
    var multilineComment: String {
        return "/**\n" + self + "\n*/"
    }
    
}
