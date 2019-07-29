//
//  Generator+Enum.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension Generator {
    
    func generateEnum(for object: ObjectContainer) -> String {
        var cases = [String]()
        var decoders = [String]()
        var encoders = [String]()
        var quickCheckers = [String]()
        var isIndirect = false
        
        for subclass in object.subclasses {
            let caseName = self.caseName(for: object.name, subclass: subclass.name)
            let docs = docsForCase(subclass)
            let tdlibType = subclass.name.lowercasedFirstLetter
            
            // quick checker
            quickCheckers.append(quickCheckerFor(caseName: caseName))
            
            // case
            var caseString = "\(docs)\ncase \(caseName.swiftEscapedIfNeeded)"
            
            // decoder
            decoders.append("case \"\(tdlibType)\":")
            var decoderInit = "self = .\(caseName)"
            
            // encoder
            var encoderCase = "case .\(caseName)"
            var caseEncoders = [
                "try container.encode(\"\(tdlibType)\", forKey: .type)",
                ""
            ]
            
            if !subclass.properties.isEmpty {
                var enumProperties = [String]()
                var decoderProperties = [String]()
                var encoderProperties = [String]()
                
                for property in subclass.properties {
                    let outputType = outputPropertyType(for: property.type)
                    
                    if object.name == property.type.nestedTdlibType {
                        isIndirect = true
                    }
                    
                    // case
                    enumProperties.append("\(property.name): \(outputType.name)\(property.optionalSuffix)")
                    
                    // decoders
                    decoders.append(decoder(for: property, outputPropertyType: outputType))
                    
                    decoderProperties.append("\(property.name): \(property.name.swiftEscapedIfNeeded)")
                    
                    // encoder
                    caseEncoders.append(encoder(for: property, outputPropertyType: outputType))

                    encoderProperties.append("let \(property.name.swiftEscapedIfNeeded)")
                }
                
                // case
                caseString += "(\(enumProperties.joined(separator: ", ")))"
                
                // decoder
                decoders.append("")
                decoderInit += "(\(decoderProperties.joined(separator: ", ")))"
                
                // encoder
                encoderCase += "(\(encoderProperties.joined(separator: ", ")))"
                caseEncoders.append("")
            }
            
            // decoder
            decoders.append(decoderInit)
            decoders.append("")
            
            // encoder
            encoders.append("\(encoderCase):")
            encoders.append(contentsOf: caseEncoders)
            
            cases.append(caseString)
        }
        
        let isPublic = internalTypes.contains(object.name) ? "" : "public "
        var output = ["\(isPublic)extension \(enumNamespace) {"]
        
        output.append("\(docsForType(object))\n\(isIndirect ? "indirect " : "")enum \(object.name): \(enumProtocol) {")
        
        // cases
        output.append(contentsOf: cases)
        
        // decoder
        output.append(decoderBody(with: decoders, type: object.name))
        
        // encoder
        output.append(encoderBody(with: encoders, type: object.name))
        
        // quick checker
        output.append(quickCheckers.joined(separator: "\n\n"))
        
        output.append("}")
        output.append("}")
        
        return output.joined(separator: "\n\n")
    }
    
    private func caseName(for superclass: String, subclass: String) -> String {
        let prefix = superclass.sharedPrefix(with: subclass)
        
        guard let range = subclass.range(of: prefix) else {
            fatalError("Wrong case: \(superclass) \(subclass)")
        }
        
        var subclass = subclass
        
        subclass.removeSubrange(range)
        
        return subclass.lowercasedFirstLetter
    }
    
    private func docsForCase(_ object: ObjectContainer) -> String {
        var lines = object.documentation.split(separator: "\n").map({ String($0) })
        
        if !object.properties.isEmpty {
            lines.append("")
        }
        
        for property in object.properties {
            lines.append("- \(property.name): \(property.documentation)")
        }
        
        return lines.joined(separator: "\n").multilineComment
    }
    
    private func decoderBody(with decoders: [String], type: String) -> String {
        var output =
            ["// MARK: - Decodable",
             "public init(from decoder: Decoder) throws {",
             "let container = try decoder.container(keyedBy: \(anyCodingKey).self)",
                "let type = try container.decode(String.self, forKey: .type)",
                "",
                "switch type {"]
        
        output.append(contentsOf: decoders)
        
        output.append(contentsOf:
            [
                "default:",
                "throw DecodingError.typeMismatch(\(type).self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: \"Undefined \(type)\"))"
            ])
        
        output.append(contentsOf:
            [
                "}",
                "}"
            ])
        
        return output.joined(separator: "\n")
    }
    
    private func encoderBody(with encoders: [String], type: String) -> String {
        var output =
            ["// MARK: - Encodable",
             "public func encode(to encoder: Encoder) throws {",
             "var container = encoder.container(keyedBy: \(anyCodingKey).self)",
                "",
                "switch self {"]
        
        output.append(contentsOf: encoders)
        
        output.append(contentsOf:
            [
                "}",
                "}"
            ])
        
        return output.joined(separator: "\n")
    }
    
    private func quickCheckerFor(caseName: String) -> String {
        return [
            "public var is\(caseName.uppercasedFirstLetter): Bool {",
            "if case .\(caseName) = self {",
            "return true",
            "} else {",
            "return false",
            "}",
            "}"
        ].joined(separator: "\n")
    }
}
