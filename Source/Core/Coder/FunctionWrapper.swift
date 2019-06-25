//
//  FunctionWrapper.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 6/25/19.
//

import Foundation

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

extension JSONEncoder {
    
    static let swiftygram = JSONEncoder()
    
}

extension JSONDecoder {
    
    static var swiftygram: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
}
