//
//  TLContainer.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/30/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

class TLContainer {
    
    let functions: [ObjectContainer]
    let objects: [ObjectContainer]
    let subclasses: [ObjectContainer]
    let enums: [ObjectContainer]

    init(functions: [ObjectContainer], objects: [ObjectContainer], subclasses: [ObjectContainer], enums: [ObjectContainer]) {
        self.functions = functions
        self.objects = objects
        self.subclasses = subclasses
        self.enums = enums
    }
    
}

// MARK: - Parser
extension TLContainer {
    
    class func parse(source: String) -> TLContainer {
        let parts = source.components(separatedBy: "---functions---")
        
        let objects = blocks(for: parts[0])
            .compactMap {
                ObjectContainer.parse(with: $0, isFunction: false)
            }
            
            + blocks(for: parts[1]).compactMap {
                ObjectContainer.parse(with: $0, isFunction: true)
        }
        
        adjustClasses(objects)
        
        return container(for: objects)
    }
    
    private class func blocks(for source: String) -> [String] {
        let lines = source.components(separatedBy: "\n")
        var output = [String]()
        var tempArr = [String]()
        var didStart = false
        
        for line in lines {
            let line = line.trimmed
            
            guard !line.isEmpty else { continue }
            
            let containsDescription = line.contains("@description")
            
            if containsDescription {
                if didStart {
                    output.append(tempArr.joined(separator: "\n"))
                } else {
                    didStart = true
                }
                
                tempArr = [line]
                
            } else if didStart {
                tempArr.append(line)
            }
        }
        
        if !tempArr.isEmpty {
            output.append(tempArr.joined(separator: "\n"))
        }
        
        return output
    }
    
    private class func classForName(_ name: String, classes: [ObjectContainer]) -> ObjectContainer {
        if let cls = classes.first(where: { $0.name == name }) {
            return cls
        }
        
        fatalError("Undefined class: \(name)")
    }
    
    private class func adjustClasses(_ classes: [ObjectContainer]) {
        // Adjust enums and subclasses
        for cls in classes {
            if forceSubclass.contains(cls.name) {
                assert(cls.isAbstract, "Class not abstract: \(cls.name)")
                
                cls.shouldBeConvertedToEnum = false
            }
            
            for property in cls.properties {
                guard let tdlibClsName = property.type.nestedTdlibType else {
                    continue
                }
                
                let propertyClass = classForName(tdlibClsName, classes: classes)
                
                assert(propertyClass.superclassName != "Function", "Property that contains function: \(propertyClass.name)")
                
                assert(propertyClass.superclassName == "Object", "Subclass referenced directly: \(propertyClass.superclassName)")
            }
        }
    }
    
    private class func container(for classes: [ObjectContainer]) -> TLContainer {
        var functions = [ObjectContainer]()
        var objects = [ObjectContainer]()
        var subclasses = [ObjectContainer]()
        var enums = [ObjectContainer]()
        
        for cls in classes {
            switch cls.superclassName {
            case "Function":
                functions.append(cls)
                
            case "Object":
                if cls.isAbstract {
                    if cls.shouldBeConvertedToEnum {
                        enums.append(cls)
                    } else {
                        subclasses.append(cls)
                    }
                } else {
                    objects.append(cls)
                }
                
            default:
                let superclass = classForName(cls.superclassName, classes: classes)
                superclass.subclasses.append(cls)
                
            }
        }
        
        return TLContainer(functions: functions, objects: objects, subclasses: subclasses, enums: enums)
    }

}
