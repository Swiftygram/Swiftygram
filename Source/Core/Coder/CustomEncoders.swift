//
//  KeyedDecodingContainerProtocol.swift
//  Pods-Swiftygram Example
//
//  Created by KY1VSTAR on 6/24/19.
//

import Foundation

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
    
    mutating func encodeDateIfPresent(_ value: Date?, forKey key: Self.Key) throws {
        try encode(Int(value?.timeIntervalSince1970 ?? 0), forKey: key)
    }
    
    mutating func encodeDate(_ value: Date, forKey key: Self.Key) throws {
        try encode(Int(value.timeIntervalSince1970), forKey: key)
    }
    
}
