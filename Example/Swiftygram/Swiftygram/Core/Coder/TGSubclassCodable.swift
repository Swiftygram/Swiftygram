//
//  TGSubclassCodable.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public class TGSubclassCodable<T>: Codable {
    
    let value: T
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TGTypeKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        for subclass in TGClassContainer.codableSubclasses(for: T.self) {
            guard let objectType = subclass as? TGObject.Type, objectType.type == type else {
                continue
            }
            
            if let value = (try! subclass.init(from: decoder)) as? T {
                self.value = value
                return
            }
        }
        
        throw DecodingError.typeMismatch(TGSubclassCodable<T>.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined generic \(T.self)"))
    }
    
    public func encode(to encoder: Encoder) throws {
        guard let encodable = value as? Encodable else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Non-encodable generic \(T.self)"))
        }
        
        try encodable.encode(to: encoder)
    }
    
}
