//
//  TypeDecider.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 6/1/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

// restrictedUntilDate
// bannedUntilDate
// publishDate

class TypeDecider {
    
    private static var urlDecisions = decisions(for: "url")
    private static var dateDecisions = decisions(for: "date")
    
    class func decide(for className: String, documentation: String, name: String, type: PropertyType) -> PropertyType {
        return type
        
        guard case .swift(let swiftType) = type else {
            return type
        }
        
        let key = className + "\n" + name
        
        if swiftType == "String" && (documentation.range(of: "url", options: .caseInsensitive) != nil || name.range(of: "url", options: .caseInsensitive) != nil) {

            if decision(for: key, decisions: &urlDecisions, documentation: documentation, name: name, desiredType: "URL") {
                return .swift("URL")
            } else {
                return type
            }

        } else if swiftType.hasPrefix("Int") && (documentation.range(of: "date", options: .caseInsensitive) != nil || name.range(of: "date", options: .caseInsensitive) != nil) {
            
            if decision(for: key, decisions: &dateDecisions, documentation: documentation, name: name, desiredType: "Date") {
                return .swift("Date")
            } else {
                return type
            }
        }
        
        return type
    }
    
    private class func decision(for key: String,
                                decisions: inout [String: Bool],
                                documentation: String,
                                name: String,
                                desiredType: String) -> Bool {
        if decisions[key] == nil {
            print()
            print(documentation)
            print()
            print(name)
            print()
            print("Should it be \(desiredType)? (y/n)")
            
            decisions[key] = getInput()
        }
        
        return decisions[key]!
    }
    
    private class func getInput() -> Bool {
        var result: String?
        
        repeat {
            result = readLine()
        } while result != "y" && result != "n"
        
        return result == "y"
    }
    
    private class func decisions(for filename: String) -> [String: Bool] {
        guard let data = try? Data(contentsOf: typeDecisionsURL.appendingPathComponent("\(filename).json")),
            let dict = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Bool] else {
                return [:]
        }
        
        return dict
    }
    
    class func save() {
        save(decisions: urlDecisions, filename: "url")
        save(decisions: dateDecisions, filename: "date")
    }
    
    private class func save(decisions: [String: Bool], filename: String) {
        let data = try! JSONSerialization.data(withJSONObject: decisions, options: [])
        
        try! data.write(to: typeDecisionsURL.appendingPathComponent("\(filename).json"))
    }
    
}
