//
//  ObjectContainer.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

private let maxPropertyCount = 5

class ObjectContainer {
    
    let documentation: String
    let name: String
    let superclassName: String
    let properties: [PropertyContainer]
    let isAbstract: Bool
    let returnType: String?
    
    var shouldBeConvertedToEnum = true
    var subclasses = [ObjectContainer]()
    
    init(documentation: String, name: String, superclassName: String, properties: [PropertyContainer], isAbstract: Bool, returnType: String?) {
        self.documentation = documentation
        self.name = name
        self.superclassName = superclassName
        self.properties = properties
        self.isAbstract = isAbstract
        self.returnType = returnType
        
        if properties.count > maxPropertyCount {
            shouldBeConvertedToEnum = false
        }
    }
    
}

// MARK: - Parser
extension ObjectContainer {
    
    private static let returnTypeRegEx = try! NSRegularExpression(pattern: "using ReturnType = object_ptr<(.*)>;", options: [])
    
    class func parse(with content: String, isFunction: Bool) -> ObjectContainer? {
        let lines = content.trimmed.components(separatedBy: "\n")
        
        var params = parseParameters(for: lines)
        
        guard !params.isEmpty, let documentation = params["description"] else {
            return nil
        }
        
        if let paramDescription = params["param_description"] {
            params["description"] = paramDescription
        }
        
        if let className = params["class"] {
            return ObjectContainer(documentation: documentation, name: className.uppercasedFirstLetter, superclassName: "Object", properties: [], isAbstract: true, returnType: nil)
        }
        
        guard let match = lines.last!.regExMatches(with: "^(\\w+)(.+)= (\\w+);$", options: .anchorsMatchLines).first else {
            return nil
        }
        
        let tdLibProperties = match[2].trimmed.components(separatedBy: " ").compactMap { pair -> (String, String)? in
            if pair.isEmpty {
                return nil
            }
            
            let components = pair.components(separatedBy: ":")
            return (components[0], components[1])
        }
        
        let properties = PropertyContainer.parse(with: tdLibProperties, parameters: params)
        
        let superclassName: String
        var returnType: String?
        
        if isFunction {
            superclassName = "Function"
            returnType = match[3].uppercasedFirstLetter
            
        } else if match[1].uppercasedFirstLetter == match[3] {
            superclassName = "Object"
            
        } else {
            superclassName = match[3]
        }
        
        return ObjectContainer(documentation: documentation,
                               name: match[1].uppercasedFirstLetter,
                               superclassName: superclassName,
                               properties: properties,
                               isAbstract: false,
                               returnType: returnType)
    }
    
    private class func parseParameters(for lines: [String]) -> [String: String] {
        let elements = lines
            .filter({ $0.hasPrefix("//") })
            .map({ $0
                .components(separatedBy: "//")
                .dropFirst()
                .joined(separator: "//")
            })
            .joined()
            .components(separatedBy: "@")
        
        var params = [String: String]()
        
        for element in elements {
            guard let match = element.regExMatches(with: "^(\\w+) (.+)$", options: .anchorsMatchLines).first else {
                continue
            }
            
            params[match[1].trimmed] = match[2].trimmed
        }
        
        return params
    }
    
}
