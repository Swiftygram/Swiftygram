//
//  Generator+Object.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension Generator {

    func generateObject(for object: ObjectContainer) -> String {
        if !object.subclasses.isEmpty {
            return generateProtocol(for: object)
        }
        
        var shouldProvideCustomCodable = false
        
        var properties = [String]()
        
        var initParams = [String]()
        var initDocsParams = [String]()
        var initBody = [String]()
        
        var decoders = [String]()
        var encoders = [String]()
        
        for property in object.properties {
            let outputType = outputPropertyType(for: property.type)
            
            if outputType.isSubclass ||
                property.type.nestedSwiftType == "Date" ||
                property.type.nestedSwiftType == "Int64" {
                shouldProvideCustomCodable = true
            }
            
            // property
            properties.append([
                property.documentation.multilineComment,
                "public let \(property.name.swiftEscapedIfNeeded): \(outputType.name)\(property.optionalSuffix)"
                ].joined(separator: "\n")
            )
            
            // init
            initParams.append("\(property.name): \(outputType.name)\(property.optionalSuffix)")
            
            initDocsParams.append("- Parameter \(property.name): \(property.documentation)")
            
            initBody.append("self.\(property.name) = \(property.name.swiftEscapedIfNeeded)")
            
            // decoder
            decoders.append(decoder(for: property, outputPropertyType: outputType, local: false))
            
            // encoder
            encoders.append(encoder(for: property, outputPropertyType: outputType))
        }
        
        let namespace: String
        let superclass: String
        
        if object.superclassName == "Function" {
            namespace = functionNamespace
            superclass = functionProtocol
        } else {
            namespace = objectNamespace
            
            superclass = object.superclassName == "Object" ? objectProtocol : "\(objectNamespace).\(object.superclassName)"
        }
        
        var output = ["public extension \(namespace) {"]
        
        output.append("\(docsForType(object))\nstruct \(object.name): \(superclass) {")
        
        // returnType
        if let returnType = object.returnType {
            let type = outputPropertyType(for: .tdlib(returnType))
            
            output.append("\(returnTypeDocumentation)\npublic typealias ReturnType = \(type.name)")
        }
        
        // properties
        output.append(contentsOf: properties)
        
        // init
        output.append(initForObject(object,
                                    initParams: initParams,
                                    initDocsParams: initDocsParams,
                                    initBody: initBody))
        
        if shouldProvideCustomCodable {
            // decoder
            output.append(decoderBody(with: decoders))
            
            // encoder
            output.append(encoderBody(with: encoders))
        }
        
        output.append(contentsOf: [
            "}",
            "}"
            ])
        
        return output.joined(separator: "\n\n")
    }
    
    private func generateProtocol(for cls: ObjectContainer) -> String {
        return [
            "public extension \(objectNamespace) {",
            docsForType(cls),
            "typealias \(cls.name) = __\(cls.name)",
            "}",
            "",
            "public protocol __\(cls.name): \(objectProtocol) {}"
        ].joined(separator: "\n")
    }
    
    private func initForObject(_ object: ObjectContainer, initParams: [String], initDocsParams: [String], initBody: [String]) -> String {
        var initDocs = object.documentation
        
        if !initDocsParams.isEmpty {
            initDocs += "\n\n" + initDocsParams.joined(separator: "\n")
        }
        
        var output = [initDocs.multilineComment]
        
        output.append("public init(\(initParams.joined(separator: ", "))) {")
        
        output.append(contentsOf: initBody)
        
        output.append("}")
        
        return output.joined(separator: "\n")
    }
    
    private func decoderBody(with decoders: [String]) -> String {
        var output =
            ["// MARK: - Decodable",
             "public init(from decoder: Decoder) throws {",
             "let container = try decoder.container(keyedBy: \(anyCodingKey).self)",
             ""]
        
        output.append(contentsOf: decoders)
        
        output.append("}")
        
        return output.joined(separator: "\n")
    }
    
    private func encoderBody(with encoders: [String]) -> String {
        var output =
            ["// MARK: - Encodable",
             "public func encode(to encoder: Encoder) throws {",
             "var container = encoder.container(keyedBy: \(anyCodingKey).self)",
             ""]
        
        output.append(contentsOf: encoders)
        
        output.append("}")
        
        return output.joined(separator: "\n")
    }
    
}
