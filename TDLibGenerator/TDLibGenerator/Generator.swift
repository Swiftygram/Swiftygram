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

/**
 Kek
 
 - ReturnType: kek
 */
class Generator {
    
    let container: TLContainer
    
    init(container: TLContainer) {
        self.container = container
    }
    
    func generate() {
        // Enums
        let enumsDirectory = outputFolderURL.appendingPathComponent("Enums")
        
        try! FileManager.default.createDirectory(at: enumsDirectory, withIntermediateDirectories: false, attributes: nil)
        
        for object in container.enums {
            let code = generateEnum(for: object)

            try! code.write(to: enumsDirectory.appendingPathComponent("\(object.name).swift"), atomically: true, encoding: .utf8)
        }
        
        // Objects
        let objectsDirectory = outputFolderURL.appendingPathComponent("Objects")
        
        try! FileManager.default.createDirectory(at: objectsDirectory, withIntermediateDirectories: false, attributes: nil)
        
        for object in container.objects {
            let code = generateObject(for: object)
            
            try! code.write(to: objectsDirectory.appendingPathComponent("\(object.name).swift"), atomically: true, encoding: .utf8)
        }
        
        // Subclasses
        for object in container.subclasses {
            let subclassDirectory = objectsDirectory.appendingPathComponent(object.name)
            
            try! FileManager.default.createDirectory(at: subclassDirectory, withIntermediateDirectories: false, attributes: nil)
            
            let code = generateObject(for: object)
            
            try! code.write(to: subclassDirectory.appendingPathComponent("\(object.name).swift"), atomically: true, encoding: .utf8)
            
            for subclass in object.subclasses {
                let code = generateObject(for: subclass)
                
                try! code.write(to: subclassDirectory.appendingPathComponent("\(subclass.name).swift"), atomically: true, encoding: .utf8)
            }
        }
        
        // Functions
        let functionsDirectory = outputFolderURL.appendingPathComponent("Functions")
        
        try! FileManager.default.createDirectory(at: functionsDirectory, withIntermediateDirectories: false, attributes: nil)
        
        for function in container.functions {
            let code = generateFunction(for: function)
            
            try! code.write(to: functionsDirectory.appendingPathComponent("\(function.name).swift"), atomically: true, encoding: .utf8)
        }
    }
    
    // MARK: - Docs
    
    func docsForType(_ type: ObjectContainer) -> String {
        var output = "/**\n\(type.documentation)"
        
        if let returnType = type.returnType {
            let propertyType = outputPropertyType(for: PropertyType.tdlib(returnType))
            
            output += "\n\n- ReturnType: `\(propertyType.name)`"
        }
        
        return "\(output)\n*/"
    }
    
    // MARK: - Property
    
    func outputPropertyType(for propertyType: PropertyType) -> OutputPropertyType {
        switch propertyType {
        case .swift(let value):
            return OutputPropertyType(name: value == "Date" ? "Foundation.Date" : value, isSubclass: false)
            
        case .tdlib(let value):
            let isSubclass = container.subclasses.contains(where: { $0.name == value })
            let isEnum = container.enums.contains(where: { $0.name == value })
            
            return OutputPropertyType(name: "\(isEnum ? enumNamespace : objectNamespace).\(value)", isSubclass: isSubclass)
            
        case .array(let value):
            let type = outputPropertyType(for: value)
            
            return OutputPropertyType(name: "[\(type.name)]", isSubclass: type.isSubclass)
        }
    }
    
    // MARK: - Decoders
    
    func decoder(for property: PropertyContainer, outputPropertyType: OutputPropertyType, local: Bool = true) -> String {
        // type
        let type = outputPropertyType.isSubclass ? "\(subclassCodable)<\(outputPropertyType.name)>" : outputPropertyType.name
        
        // methodPrefix
        var methodPrefix = "decode"
        var shouldAddType = false
        
        switch property.type.nestedSwiftType {
        case .some("Date"):
            methodPrefix += "Date"
            
        case .some("Int64"):
            if case .array(_) = property.type {
                methodPrefix += "Int64Array"
            } else {
                methodPrefix += "Int64"
            }
            
        default:
            shouldAddType = true
        }
        
        methodPrefix += property.isOptional ? "IfPresent(" : "("
        
        if shouldAddType {
            methodPrefix += "\(type).self, "
        }
        // ---
        
        var str = "\(local ? "let " : "self.")\(property.name.swiftEscapedIfNeeded) = try container.\(methodPrefix)forKey: .init(string: \"\(property.name)\"))"
        
        if outputPropertyType.isSubclass {
            str += ".value"
        }
        
        return str
    }
    
    // MARK: - Encoders
    
    func encoder(for property: PropertyContainer, outputPropertyType: OutputPropertyType) -> String {
        var method = "encode"
        
        switch property.type.nestedSwiftType {
        case .some("Date"):
            method += "Date"
            
        case .some("Int64"):
            if case .array(_) = property.type {
                method += "Int64Array"
            } else {
                method += "Int64"
            }
            
        default:
            break
        }
        
        method += property.isOptional ? "IfPresent" : ""
        
        let propertyName = property.name.swiftEscapedIfNeeded

        let value = outputPropertyType.isSubclass ? "\(subclassCodable)(value: \(propertyName))" : propertyName
        
        return "try container.\(method)(\(value), forKey: .init(string: \"\(property.name)\"))"
    }
    
}
