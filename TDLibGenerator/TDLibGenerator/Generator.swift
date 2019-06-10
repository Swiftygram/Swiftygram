//
//  Generator.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

class Generator {
//
//    let classes: HeadersParser.Result
//
//    init(classes: HeadersParser.Result) {
//        self.classes = classes
//    }
//
//    func generate() {
//
//        let res = generateEnum(for: classes.enums.first!)
//
//        try! res.write(toFile: "/Users/ky1vstar/Downloads/Архив 2/TDLibGenerator/Output/kek.swift", atomically: true, encoding: .utf8)
//
    
//        for cls in classes {
//            let output: String
//
//            switch cls.superclassName {
//            case "Function":
//                output = generateFunction(for: cls)
//
//            case "Object":
//                output = cls.isAbstract && cls.shouldBeConvertedToEnum ? generateEnum(for: cls) : generateObject(for: cls)
//
//            default:
//                if classForName(cls.superclassName).shouldBeConvertedToEnum {
//                    continue
//                }
//
//                output = generateObject(for: cls)
//            }
//
//        }
//    }
    
//    func classForName(_ name: String) -> ObjectContainer {
//        if let cls = classes.first(where: { $0.name == name }) {
//            return cls
//        }
//        
//        fatalError("Undefined class: \(name)")
//    }
//    
//    func superclassForName(_ name: String) -> ObjectContainer {
//        let superclassName = classForName(name).superclassName
//        
//        return classForName(superclassName)
//    }
    
}
