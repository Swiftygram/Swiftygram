//
//  TypeDecider.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 6/1/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

class TypeDecider {
    
    static var urlDecisions = [String: Bool]()
    static var dateDecisions = [String: Bool]()
    
    class func decide(for documentation: String, name: String, type: PropertyType) -> PropertyType {
        return type
        
        guard case .swift(let swiftType) = type else {
            return type
        }
        
        if swiftType == "String" && (documentation.range(of: "url", options: .caseInsensitive) != nil || name.range(of: "url", options: .caseInsensitive) != nil) {
            
            let str = documentation + "\n" + name
            
            guard urlDecisions[str] == nil else {
                return type
            }
            
            print()
            print(documentation)
            print()
            print(name)
            print()
            print("Should it be URL? (y/n)")
            
            urlDecisions[str] = getInput()

        } else if swiftType.hasPrefix("Int") && (documentation.range(of: "date", options: .caseInsensitive) != nil || name.range(of: "date", options: .caseInsensitive) != nil) {
            
            let str = documentation + "\n" + name
            
            guard dateDecisions[str] == nil else {
                return type
            }
            
            print()
            print(documentation)
            print()
            print(name)
            print()
            print("Should it be Date? (y/n)")

            dateDecisions[str] = getInput()
            
        }
        
        return type
    }
    
    private class func getInput() -> Bool {
        var result: String?
        
        repeat {
            result = readLine()
        } while result != "y" && result != "n"
        
        return result == "y"
    }
    
}
