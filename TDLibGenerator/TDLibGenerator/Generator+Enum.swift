//
//  Generator+Enum.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension Generator {
    
    func generateEnum(for cls: ObjectContainer) -> String {
        var output = ["public extension TGEnum {"]
        
        output.append("enum \(cls.name): TGEnumProtocol {")
        
        for subclass in cls.subclasses {
            let caseName = self.caseName(for: cls.name, subclass: subclass.name)
            let docs = docsForCase(subclass)
            
            let str = "\(docs)\ncase \(caseName)"
            
            output.append(str)
        }
        
        output.append("}")
        output.append("}")
        
        return output.joined(separator: "\n\n")
    }
    
    private func caseName(for superclass: String, subclass: String) -> String {
        guard let range = subclass.range(of: superclass) else {
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
        
        return "/// " + lines.joined(separator: "\n/// ")
    }
    
}
