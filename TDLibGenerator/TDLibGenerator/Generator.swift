//
//  Generator.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

struct OutputPropertyType {
    let name: String
    let isSubclass: Bool
}

class Generator {
    
    let container: TLContainer
    
    init(container: TLContainer) {
        self.container = container
    }
    
    func generate() {
        for object in container.enums {
            let code = generateEnum(for: object)
            
            try! code.write(to: outputFolderURL.appendingPathComponent("\(object.name).swift"), atomically: true, encoding: .utf8)
        }
    }
    
    func outputPropertyType(for propertyType: PropertyType) -> OutputPropertyType {
        switch propertyType {
        case .swift(let value):
            return OutputPropertyType(name: value, isSubclass: false)
            
        case .tdlib(let value):
            let isSubclass = container.subclasses.contains(where: { $0.name == value })
            let isEnum = container.enums.contains(where: { $0.name == value })
            
            return OutputPropertyType(name: "\(isEnum ? enumNamespace : objectNamespace).\(value)", isSubclass: isSubclass)
            
        case .array(let value):
            let type = outputPropertyType(for: value)
            
            return OutputPropertyType(name: "[\(type.name)]", isSubclass: type.isSubclass)
        }
    }
    
    func decoder(for property: PropertyContainer, outputPropertyType: OutputPropertyType) -> String {
        let method = property.isOptional ? "decodeIfPresent" : "decode"
        let type = outputPropertyType.isSubclass ? "SubclassCodable<\(outputPropertyType.name)>" : outputPropertyType.name
        
        var str = "let \(property.name) = try container.\(method)(\(type).self, forKey: .init(string: \"\(property.name)\"))"
        
        if outputPropertyType.isSubclass {
            str += ".value"
        }
        
        return str
    }
    
    func encoder(for property: PropertyContainer, outputPropertyType: OutputPropertyType) -> String {
        let method = property.isOptional ? "encodeIfPresent" : "encode"
        
        let value = outputPropertyType.isSubclass ? "SubclassCodable(value: \(property.name)" : property.name
        
        return "try container.\(method)(\(value), forKey: .init(string: \"\(property.name)\"))"
    }
    
}
