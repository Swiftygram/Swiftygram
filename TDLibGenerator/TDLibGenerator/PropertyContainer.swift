//
//  PropertyContainer.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/30/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

indirect enum PropertyType {
    case swift(String)
    case tdlib(String)
    case array(PropertyType)
    
    var nestedTdlibType: String? {
        switch self {
        case .tdlib(let type):
            return type
            
        case .array(let nested):
            return nested.nestedTdlibType
            
        default:
            return nil
        }
    }
    
    var nestedSwiftType: String? {
        switch self {
        case .swift(let type):
            return type
            
        case .array(let nested):
            return nested.nestedSwiftType
            
        default:
            return nil
        }
    }
    
}

class PropertyContainer {
    
    let documentation: String
    let type: PropertyType
    let name: String
    let isOptional: Bool
    
    init(documentation: String, type: PropertyType, name: String, isOptional: Bool) {
        self.documentation = documentation
        self.type = type
        self.name = name
        self.isOptional = isOptional
    }
    
}

// MARK: - Parser
extension PropertyContainer {
    
    class func parse(with tdLibProperties: [(name: String, type: String)], parameters: [String: String], className: String) -> [PropertyContainer] {
        return tdLibProperties.map({ (name, type) -> PropertyContainer in
            guard let documentation = parameters[name] else {
                fatalError("Uncommented property \(name)")
            }
            
            let propertyName = convertFromSnakeCase(name)
            
            let propertyType = TypeDecider.decide(for: className,
                                                  documentation: documentation,
                                                  name: propertyName,
                                                  type: self.propertyType(for: type))
            
            let isOptional = self.isOptional(documentation: documentation, propertyType: propertyType)
            
            return PropertyContainer(documentation: documentation,
                                     type: propertyType,
                                     name: propertyName,
                                     isOptional: isOptional)
        })
    }
    
    private class func propertyType(for cppType: String) -> PropertyType {
        if let nestedType = cppType.regExMatches(with: "^vector<(.*)>$", options: .anchorsMatchLines).first?[1] {
            return .array(propertyType(for: nestedType))
            
        }
        
        switch cppType {
        case "int32":
            return .swift("Int")
            
        case "int64", "int53":
            return .swift("Int64")
            
        case "string", "bytes":
            return .swift("String")
            
        case "Bool":
            return .swift("Bool")
            
        case "double":
            return .swift("Double")
            
        default:
            return .tdlib(cppType.uppercasedFirstLetter)
        }
    }
    
    private class func isOptional(documentation: String, propertyType: PropertyType) -> Bool {
        return documentation.range(of: "\\Wnull\\w", options: [.caseInsensitive, .regularExpression]) != nil ||
            documentation.range(of: "optional\\w", options: [.caseInsensitive, .regularExpression]) != nil ||
            documentation.range(of: "\\wif it exists\\w", options: [.caseInsensitive, .regularExpression]) != nil ||
            documentation.range(of: "if applicable") != nil ||
            documentation.range(of: "if available") != nil ||
            (documentation.range(of: "0 if unknown") != nil && propertyType.nestedSwiftType == "Date")
        
//        0 if never
    }
    
    private static func convertFromSnakeCase(_ stringKey: String) -> String {
        guard !stringKey.isEmpty else { return stringKey }
        
        var stringKey = stringKey
        if stringKey.last == "_" {
            stringKey = String(stringKey.dropLast())
        }
        
        // Find the first non-underscore character
        guard let firstNonUnderscore = stringKey.firstIndex(where: { $0 != "_" }) else {
            // Reached the end without finding an _
            return stringKey
        }
        
        // Find the last non-underscore character
        var lastNonUnderscore = stringKey.index(before: stringKey.endIndex)
        while lastNonUnderscore > firstNonUnderscore && stringKey[lastNonUnderscore] == "_" {
            stringKey.formIndex(before: &lastNonUnderscore)
        }
        
        let keyRange = firstNonUnderscore...lastNonUnderscore
        let leadingUnderscoreRange = stringKey.startIndex..<firstNonUnderscore
        let trailingUnderscoreRange = stringKey.index(after: lastNonUnderscore)..<stringKey.endIndex
        
        let components = stringKey[keyRange].split(separator: "_")
        let joinedString : String
        if components.count == 1 {
            // No underscores in key, leave the word as is - maybe already camel cased
            joinedString = String(stringKey[keyRange])
        } else {
            joinedString = ([components[0].lowercased()] + components[1...].map { $0.capitalized }).joined()
        }
        
        // Do a cheap isEmpty check before creating and appending potentially empty strings
        let result : String
        if (leadingUnderscoreRange.isEmpty && trailingUnderscoreRange.isEmpty) {
            result = joinedString
        } else if (!leadingUnderscoreRange.isEmpty && !trailingUnderscoreRange.isEmpty) {
            // Both leading and trailing underscores
            result = String(stringKey[leadingUnderscoreRange]) + joinedString + String(stringKey[trailingUnderscoreRange])
        } else if (!leadingUnderscoreRange.isEmpty) {
            // Just leading
            result = String(stringKey[leadingUnderscoreRange]) + joinedString
        } else {
            // Just trailing
            result = joinedString + String(stringKey[trailingUnderscoreRange])
        }
        return result
    }
    
}
