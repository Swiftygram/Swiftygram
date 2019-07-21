//
//  main.swift
//  LocalizationGenerator
//
//  Created by KY1VSTAR on 7/21/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

guard CommandLine.arguments.count > 1 else {
    print("No path")
    exit(0)
}

let rootURL = URL(fileURLWithPath: CommandLine.arguments[1])

let stringFiles = try! FileManager.default.contentsOfDirectory(at: rootURL.appendingPathComponent("Localizations/Strings"),
                                                               includingPropertiesForKeys: nil,
                                                               options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles])

func getUsedKeywords() -> [String] {
    let usedKeywordsData = try! Data(contentsOf: rootURL.appendingPathComponent("Localizations/used_keywords.txt"))
    let usedKeywordsString = String(data: usedKeywordsData, encoding: .utf8)!
    let nsString = usedKeywordsString as NSString
    
    let regEx = try! NSRegularExpression(pattern: "L\\.([\\w\\.]+)$", options: .anchorsMatchLines)
    
    return regEx.matches(in: usedKeywordsString, options: [], range: NSMakeRange(0, nsString.length)).map { match in
        return nsString.substring(with: match.range(at: 1))
    }
}

func escapeString(_ string: String) -> String {
    let jsonString = String(data: try! JSONSerialization.data(withJSONObject: [string], options: []), encoding: .utf8)!
    
    let range = jsonString.index(jsonString.startIndex, offsetBy: 2)..<jsonString.index(jsonString.endIndex, offsetBy: -2)
    
    return String(jsonString[range])
}

let usedKeywords = getUsedKeywords()

for stringFileURL in stringFiles {
    let locale = stringFileURL.deletingPathExtension().lastPathComponent
    let strings = NSDictionary(contentsOf: stringFileURL) as! [String: String]
    let outputDict = NSMutableDictionary()
    
    for keyword in usedKeywords {
        if keyword.hasPrefix("locale") {
            outputDict["locale"] = stringFileURL.deletingPathExtension().lastPathComponent
            continue
        }
        
        outputDict[keyword] = strings[keyword]!
    }
    
    let output = (outputDict as! [String: String]).map { key, value -> String in
        "\"\(key)\" = \"\(escapeString(value))\";"
    }.joined(separator: "\n")
    
    let dirURL = rootURL.appendingPathComponent("Source/AuthUI/iOS/\(locale).lproj")
    try! FileManager.default.createDirectory(at: dirURL, withIntermediateDirectories: true, attributes: nil)
    
    try! output.write(to: dirURL.appendingPathComponent("Localizable.strings"), atomically: true, encoding: .utf8)
}

