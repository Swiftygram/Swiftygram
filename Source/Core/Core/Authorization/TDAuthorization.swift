//
//  TDAuthorization.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

public final class TDAuthorization: NSObject, Codable, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool {
        return true
    }

    let apiId: Int
    let apiHash: String
    let accountId: String
    let databaseEncryptionKey: String
    let usesTestEnvironment: Bool
    let appGroupId: String?

    init(apiId: Int, apiHash: String, accountId: String, databaseEncryptionKey: String, usesTestEnvironment: Bool, appGroupId: String?) {
        self.apiId = apiId
        self.apiHash = apiHash
        self.accountId = accountId
        self.databaseEncryptionKey = databaseEncryptionKey
        self.usesTestEnvironment = usesTestEnvironment
        self.appGroupId = appGroupId
    }

    public init?(coder aDecoder: NSCoder) {
        guard let apiId = aDecoder.decodeObject(of: NSNumber.self, forKey: CodingKeys.apiId.stringValue),
            let apiHash = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.apiHash.stringValue),
            let accountId = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.accountId.stringValue),
            let databaseEncryptionKey = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.databaseEncryptionKey.stringValue),
            let usesTestEnvironment = aDecoder.decodeObject(of: NSNumber.self, forKey: CodingKeys.usesTestEnvironment.stringValue) else {
                return nil
        }
       
        self.apiId = apiId.intValue
        self.apiHash = apiHash as String
        self.accountId = accountId as String
        self.databaseEncryptionKey = databaseEncryptionKey as String
        self.usesTestEnvironment = usesTestEnvironment.boolValue
        self.appGroupId = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.appGroupId.stringValue) as String?
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(apiId, forKey: CodingKeys.apiId.stringValue)
        aCoder.encode(apiHash, forKey: CodingKeys.apiHash.stringValue)
        aCoder.encode(accountId, forKey: CodingKeys.accountId.stringValue)
        aCoder.encode(databaseEncryptionKey, forKey: CodingKeys.databaseEncryptionKey.stringValue)
        aCoder.encode(usesTestEnvironment, forKey: CodingKeys.usesTestEnvironment.stringValue)
        aCoder.encode(appGroupId, forKey: CodingKeys.appGroupId.stringValue)
    }

}
