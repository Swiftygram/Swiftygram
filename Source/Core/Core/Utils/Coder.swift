//
//  AnyCodingKey.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 6/1/19.
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

// MARK: - AnyCodingKey

struct AnyCodingKey: CodingKey {
    
    static let type = AnyCodingKey(string: "@type")
    
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        intValue = nil
    }
    
    init?(intValue: Int) {
        stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(string: String) {
        stringValue = string
        intValue = nil
    }
    
}

// MARK: - KeyedDecodingContainerProtocol

extension KeyedDecodingContainerProtocol {
    
    func decodeInt64IfPresent(forKey key: Self.Key) throws -> Int64? {
        var occuredError: Error?
        
        do {
            if let value = try decodeIfPresent(Int64.self, forKey: key) {
                return value
            }
        } catch {
            occuredError = error
        }
        
        do {
            if let value = try decodeIfPresent(String.self, forKey: key) {
                if let intValue = Int64(value) {
                    return intValue
                }
                
                throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Failed to convert `\(value)` to Int64")
            }
        } catch {
            occuredError = error
        }
        
        if let error = occuredError {
            throw error
        }
        
        return nil
    }
    
    func decodeInt64(forKey key: Self.Key) throws -> Int64 {
        if let value = try decodeInt64IfPresent(forKey: key) {
            return value
        }
        
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "Failed to parse Int64"))
    }
    
    func decodeInt64ArrayIfPresent(forKey key: Self.Key) throws -> [Int64]? {
        var occuredError: Error?
        
        do {
            if let values = try decodeIfPresent([Int64].self, forKey: key) {
                return values
            }
        } catch {
            occuredError = error
        }
        
        do {
            if let values = try decodeIfPresent([String].self, forKey: key) {
                return try values.map {
                    if let intValue = Int64($0) {
                        return intValue
                    }
                    
                    throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Failed to convert `\($0)` to Int64")
                }
            }
        } catch {
            occuredError = error
        }
        
        if let error = occuredError {
            throw error
        }
        
        return nil
    }
    
    func decodeInt64Array(forKey key: Self.Key) throws -> [Int64] {
        if let value = try decodeInt64ArrayIfPresent(forKey: key) {
            return value
        }
        
        throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: codingPath, debugDescription: "Failed to parse [Int64]"))
    }
    
    func decodeDateIfPresent(forKey key: Self.Key) throws -> Date? {
        guard let time = try decodeIfPresent(Int.self, forKey: key),
            time > 0 else {
                return nil
        }
        
        return Date(timeIntervalSince1970: TimeInterval(time))
    }
    
    func decodeDate(forKey key: Self.Key) throws -> Date {
        let time = try decode(TimeInterval.self, forKey: key)
        
        return Date(timeIntervalSince1970: time)
    }
    
}

// MARK: - KeyedEncodingContainerProtocol

extension KeyedEncodingContainerProtocol {
    
    mutating func encodeInt64IfPresent(_ value: Int64?, forKey key: Self.Key) throws {
        guard let intValue = value else {
            return try encodeIfPresent(value, forKey: key)
        }
        
        try encode("\(intValue)", forKey: key)
    }
    
    mutating func encodeInt64(_ value: Int64, forKey key: Self.Key) throws {
        try encode("\(value)", forKey: key)
    }
    
    mutating func encodeInt64ArrayIfPresent(_ value: [Int64]?, forKey key: Self.Key) throws {
        try encodeIfPresent(value?.map { "\($0)" }, forKey: key)
    }
    
    mutating func encodeInt64Array(_ value: [Int64], forKey key: Self.Key) throws {
        try encode(value.map { "\($0)" }, forKey: key)
    }
    
    mutating func encodeDateIfPresent(_ value: Date?, forKey key: Self.Key) throws {
        try encode(Int(value?.timeIntervalSince1970 ?? 0), forKey: key)
    }
    
    mutating func encodeDate(_ value: Date, forKey key: Self.Key) throws {
        try encode(Int(value.timeIntervalSince1970), forKey: key)
    }
    
}

// MARK: - FunctionWrapper

struct FunctionWrapper<Function: TDFunctionProtocol>: Encodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case extra = "@extra"
    }
    
    let function: Function
    let queryId: UInt64?
    
    public init(function: Function, queryId: UInt64?) {
        self.function = function
        self.queryId = queryId
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(Function.type, forKey: .type)
        try container.encodeIfPresent(queryId, forKey: .extra)
        try self.function.encode(to: encoder)
    }
}

// MARK: - TDLibResponse

struct TDLibResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case extra = "@extra"
    }
    
    let type: String?
    let queryId: UInt64?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decodeIfPresent(String.self, forKey: .type)
        queryId = try container.decodeIfPresent(UInt64.self, forKey: .extra)
    }
}

// MARK: - JSONEncoder

extension JSONEncoder {
    
    static var swiftygram: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
}

// MARK: - JSONDecoder

extension JSONDecoder {
    
    static var swiftygram: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
}
