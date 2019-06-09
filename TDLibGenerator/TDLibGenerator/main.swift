//
//  main.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/29/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import Commander

let main = command { (inputFolder: String, outputFolder: String) in
    let inputFolderURL = URL(fileURLWithPath: inputFolder)
    let outputFolderURL = URL(fileURLWithPath: outputFolder)
    
    try? FileManager.default.removeItem(at: outputFolderURL)
    try FileManager.default.createDirectory(at: outputFolderURL, withIntermediateDirectories: false, attributes: nil)
    
    let source = try String(contentsOf: inputFolderURL.appendingPathComponent("td_api.tl"))
    
    let parser = HeadersParser(headersString: source,
                               ignoredClasses: ["Error"],
                               fullPathClasses: ["Date"],
                               forceSubclass: ["Update"])

    HeadersParser.parse(source: source)
}

main.run()

//let source = try! String(contentsOfFile: "/Users/ky1vstar/Downloads/Архив 2/TDLibGenerator/TDLibGenerator/td_api.h")
//
//let parser = HeadersParser(headersString: source,
//                           ignoredClasses: ["Error"],
//                           fullPathClasses: ["Date"],
//                           forceSubclass: ["Update"])
//
//let classes = parser.parse()
//
//let generator = Generator(classes: classes)
//
//generator.generate()
