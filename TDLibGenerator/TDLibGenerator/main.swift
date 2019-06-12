//
//  main.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/29/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import Commander

// MARK: - Constants

let enumNamespace = "TDEnum"
let enumProtocol = "TDEnumProtocol"

let objectNamespace = "TDObject"

let functionNamespace = "TDFunction"
let functionProtocol = "TDFunctionProtocol"

let anyCodingKey = "AnyCodingKey"
let subclassCodable = "SubclassCodable"

let maxPropertyCount = 5
let forceSubclass = ["Update"]
let ignoredClasses = ["Error"]

// MARK: - Global

private(set) var typeDecisionsURL = URL(fileURLWithPath: "")
private(set) var outputFolderURL = URL(fileURLWithPath: "")

// MARK: - Main

let main = command { (tdApiPath: String, typeDecisionsFolder: String, outputFolder: String) in
    typeDecisionsURL = URL(fileURLWithPath: typeDecisionsFolder)
    outputFolderURL = URL(fileURLWithPath: outputFolder)
    
    try? FileManager.default.removeItem(at: outputFolderURL)
    try FileManager.default.createDirectory(at: outputFolderURL, withIntermediateDirectories: false, attributes: nil)
    
    let source = try String(contentsOfFile: tdApiPath, encoding: .utf8)

    let container = TLContainer.parse(source: source)
    
    Generator(container: container).generate()
}

main.run()
