//
//  Generator+Object.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/31/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension Generator {

    func generateObject(for cls: ObjectContainer) -> String {
        if !cls.subclasses.isEmpty {
            return generateProtocol(for: cls)
        }
        
        return ""
    }
    
    /**
     Kek
     
     - important: Lol, kek
     */
    private func generateProtocol(for cls: ObjectContainer) -> String {
        return [
            "public extension \(objectNamespace) {",
            "typealias \(cls.name) = __\(cls.name)",
            "}",
            "",
            "public protocol __\(cls.name): \(objectProtocol) {",
            "}"
        ].joined(separator: "\n")
    }
    
}
