//
//  TextEntityType.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGEnum {
    
    public enum TextEntityType: TGEnumProtocol {
        
        private static let autoCodableTypes = [TextEntityType.bold,
                                                .botCommand,
                                                .cashtag,
                                                .code,
                                                .emailAddress,
                                                .hashtag,
                                                .italic,
                                                .mention,
                                                .phoneNumber,
                                                .pre,
                                                .url]
        
        case bold
        
        case botCommand
        
        case cashtag
        
        case code
        
        case emailAddress
        
        case hashtag
        
        case italic
        
        case mention
        
        case mentionName(userId: Int)
        
        case phoneNumber
        
        case pre
        
        case preCode(language: String)
        
        case textURL(url: URL)
        
        case url
        
        
        enum MentionNameKeys: String, CodingKey {
            case userId
        }
        
        enum PreCodeKeys: String, CodingKey {
            case language
        }
        
        enum TextURLKeys: String, CodingKey {
            case url
        }
        
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: TGTypeKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            
            if let value = TextEntityType.autoCodableTypes.first(where: { $0.codableType == type }) {
                self = value
                return
            }
            
            switch type {
            case "textEntityTypeMentionName":
                let container = try decoder.container(keyedBy: MentionNameKeys.self)
                
                let userId = try container.decode(Int.self, forKey: .userId)
                
                self = .mentionName(userId: userId)
                
            case "textEntityTypePreCode":
                let container = try decoder.container(keyedBy: PreCodeKeys.self)
                
                let language = try container.decode(String.self, forKey: .language)
                
                self = .preCode(language: language)
                
            case "textEntityTypeTextUrl":
                let container = try decoder.container(keyedBy: TextURLKeys.self)
                
                let url = try container.decode(URL.self, forKey: .url)
                
                self = .textURL(url: url)
                
            default:
                throw DecodingError.typeMismatch(TextEntityType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TextEntityType"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: TGTypeKeys.self)
            
            if let type = codableType {
                try container.encode(type, forKey: .type)
                return
            }
            
            switch self {
            case .mentionName(let userId):
                try container.encode("textEntityTypeMentionName", forKey: .type)
                
                var container = encoder.container(keyedBy: MentionNameKeys.self)
                
                try container.encode(userId, forKey: .userId)
                
            case .preCode(let language):
                try container.encode("textEntityTypePreCode", forKey: .type)
                
                var container = encoder.container(keyedBy: PreCodeKeys.self)
                
                try container.encode(language, forKey: .language)
                
            case .textURL(let url):
                try container.encode("textEntityTypeTextUrl", forKey: .type)
                
                var container = encoder.container(keyedBy: TextURLKeys.self)
                
                try container.encode(url, forKey: .url)
                
            default:
                break
            }
        }
        
        private var codableType: String? {
            switch self {
            case .bold:
                return "textEntityTypeBold"
                
            case .botCommand:
                return "textEntityTypeBotCommand"
                
            case .cashtag:
                return "textEntityTypeCashtag"
                
            case .code:
                return "textEntityTypeCode"
                
            case .emailAddress:
                return "textEntityTypeEmailAddress"
                
            case .hashtag:
                return "textEntityTypeHashtag"
                
            case .italic:
                return "textEntityTypeItalic"
                
            case .mention:
                return "textEntityTypeMention"
                
            case .phoneNumber:
                return "textEntityTypePhoneNumber"
                
            case .pre:
                return "textEntityTypePre"
                
            case .url:
                return "textEntityTypeUrl"
                
            default:
                return nil
            }
        }
        
    }
    
}
