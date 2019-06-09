//
//  HeadersParser.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/30/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

class HeadersParser {
    
    typealias Result = (functions: [ObjectContainer], objects: [ObjectContainer], subclasses: [ObjectContainer], enums: [ObjectContainer])
    
    let headersString: String
    let ignoredClasses: [String]
    let forceSubclass: [String]
    
    private var classes = [ObjectContainer]()
    private let headersNSString: NSString
    private let classRegEx = try! NSRegularExpression(pattern: "(\\/\\*\\*.+?\\*\\/)\nclass (\\w+)(?: final )?: public (\\w*) (\\{)", options: NSRegularExpression.Options.dotMatchesLineSeparators)
//    private let classRegEx = try! NSRegularExpression(pattern: "(\\/\\*\\*[^(?:)]+\\*\\/)\nclass (\\w+)(?: final )?: public (\\w*) (\\{)", options: NSRegularExpression.Options.dotMatchesLineSeparators)
    
    init(headersString: String, ignoredClasses: [String], fullPathClasses: [String], forceSubclass: [String]) {
        self.headersString = headersString
        headersNSString = headersString as NSString
        self.ignoredClasses = ignoredClasses + ["Object", "Function"]
        self.forceSubclass = forceSubclass
    }
    
    class func parse(source: String) {
        let parts = source.components(separatedBy: "---functions---")
        
        let objectComponents = parts[0].components(separatedBy: "\n\n")
        let functionComponents = parts[1].components(separatedBy: "\n\n")
        
        let objects = objectComponents.compactMap {
            ObjectContainer.parse(with: $0, isFunction: false)
            }
            
            + functionComponents.compactMap {
                ObjectContainer.parse(with: $0, isFunction: true)
        }
        
        adjustClasses(objects)
        
        print(objects)
    }
    
    private class func adjustClasses(_ classes: [ObjectContainer]) {
        func classForName(_ name: String) -> ObjectContainer {
            if let cls = classes.first(where: { $0.name == name }) {
                return cls
            }
            
            fatalError("Undefined class: \(name)")
        }
        
        // Adjust enums and subclasses
        for cls in classes {
//            if forceSubclass.contains(cls.name) {
//                assert(cls.isAbstract, "Class not abstract: \(cls.name)")
//                
//                cls.shouldBeConvertedToEnum = false
//            }
            
            for property in cls.properties {
                guard let tdlibClsName = property.type.nestedTdlibType else {
                    continue
                }
                
                let propertyClass = classForName(tdlibClsName)
                
                assert(propertyClass.superclassName != "Function", "Property that contains function: \(propertyClass.name)")
                
                assert(propertyClass.superclassName == "Object", "Subclass referenced directly: \(propertyClass.superclassName)")
            }
        }
    }
    
    
    func parse2() {
        let components = headersString.components(separatedBy: "\n\n")
        
        print(components.count)
    }
    
//    func parse() -> Result {
//        classes = classRegEx.matches(in: headersString, options: [], range: NSMakeRange(0, headersNSString.length)).compactMap { result -> ObjectContainer? in
//            let className = headersNSString.substring(with: result.range(at: 2))
//
//            if ignoredClasses.contains(className) {
//                return nil
//            }
//            
//            guard let classBody = self.classBody(with: result.range(at: 4).location) else {
//                fatalError("Failed to parse class body")
//            }
//            
//            var docs = headersNSString.substring(with: result.range(at: 1))
//            if let range = docs.range(of: "/*", options: .backwards) {
//                docs = String(docs[range.lowerBound...])
//            }
//            
//            return ObjectContainer.parse(with: docs,
//                                         name: className,
//                                         superclassName: headersNSString.substring(with: result.range(at: 3)),
//                                         classBody: classBody)
//        }
//        
//        adjustClasses()
//        
//        var functions = [ObjectContainer]()
//        var objects = [ObjectContainer]()
//        var subclasses = [ObjectContainer]()
//        var enums = [ObjectContainer]()
//        
//        for cls in classes {
//            switch cls.superclassName {
//            case "Function":
//                functions.append(cls)
//                
//            case "Object":
//                if cls.isAbstract {
//                    if cls.shouldBeConvertedToEnum {
//                        enums.append(cls)
//                    } else {
//                        subclasses.append(cls)
//                    }
//                } else {
//                    objects.append(cls)
//                }
//                
//            default:
//                let superclass = classForName(cls.superclassName)
//                superclass.subclasses.append(cls)
//                
//            }
//        }
//        
//        
//        try! JSONSerialization.data(withJSONObject: TypeDecider.urlDecisions, options: []).write(to: URL(fileURLWithPath: "/Users/ky1vstar/Downloads/Архив 2/TDLibGenerator/urlDecisions.json"))
//        
//        try! JSONSerialization.data(withJSONObject: TypeDecider.dateDecisions, options: []).write(to: URL(fileURLWithPath: "/Users/ky1vstar/Downloads/Архив 2/TDLibGenerator/dateDecisions.json"))
//        
//        return (functions, objects, subclasses, enums)
//    }
    
    private func classBody(with startBracesIndex: Int) -> String? {
        let tempString = headersNSString.substring(with: NSMakeRange(startBracesIndex, headersNSString.length - startBracesIndex))
        
        var bodyString: String?
        var openedBracesCount = 0
        for (index, character) in tempString.enumerated() {
            if character == "{" {
                openedBracesCount += 1
            } else if character == "}" {
                openedBracesCount -= 1
            }
            
            if openedBracesCount == 0 {
                bodyString = String(tempString[...tempString.index(tempString.startIndex, offsetBy: index)])
                break
            }
        }
        
        return bodyString
    }
    
    private func classForName(_ name: String) -> ObjectContainer {
        if let cls = classes.first(where: { $0.name == name }) {
            return cls
        }
        
        fatalError("Undefined class: \(name)")
    }
    
    private func adjustClasses() {
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
                
                let propertyClass = classForName(tdlibClsName)
                
                assert(propertyClass.superclassName != "Function", "Property that contains function: \(propertyClass.name)")
                
                assert(propertyClass.superclassName == "Object", "Subclass referenced directly: \(propertyClass.superclassName)")
            }
        }
    }
    
}
