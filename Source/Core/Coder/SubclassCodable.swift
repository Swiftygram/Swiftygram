//
//  TGSubclassCodable.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

private func typeForSuperclass(_ superclass: Any.Type, type: String) -> TDObjectProtocol.Type? {
    return (subclassContainer[HashableType(superclass)] ?? []).first(where: { $0.type == type })
}

// MARK: - Array of SubclassCodable

protocol SubclassCodableMarker {
    associatedtype T
    
    var value: T { get }
}

extension Array where Element: SubclassCodableMarker {
    var value: [Element.T] {
        return map { $0.value }
    }
}

// MARK: - SubclassCodable

struct SubclassCodable<T>: Codable, SubclassCodableMarker {
    
    let value: T
    
    init(value: T) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        let type = try container.decode(String.self, forKey: .type)
        
        if let subclass = typeForSuperclass(T.self, type: type),
            let value = (try subclass.init(from: decoder)) as? T {
            self.value = value
            return
        }
        
        throw DecodingError.typeMismatch(T.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined generic \(T.self)"))
    }
    
    func encode(to encoder: Encoder) throws {
        guard let encodable = value as? Encodable else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Non-encodable generic \(T.self)"))
        }
        
        try encodable.encode(to: encoder)
    }
    
}
