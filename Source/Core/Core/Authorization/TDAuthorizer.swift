//
//  TDAuthorizer.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

// MARK: - TDAuthorizerConfiguration

public struct TDAuthorizerConfiguration {
    public var apiId: Int
    public var apiHash: String
    public var usesTestEnvironment: Bool
    public var appGroupId: String?

    public init(apiId: Int, apiHash: String, usesTestEnvironment: Bool = false, appGroupId: String? = nil) {
        self.apiId = apiId
        self.apiHash = apiHash
        self.usesTestEnvironment = usesTestEnvironment
        self.appGroupId = appGroupId
    }
}

// MARK: - TDAuthorizer

public class TDAuthorizer {
    
    public class func authorization(with configuration: TDAuthorizerConfiguration, delegate: TDAuthorizerDelegate, completion: @escaping TDAuthorizationResultHandler) -> TDAuthorizationFlow {
        return TDInternalAuthorizer(configuration: configuration, delegate: delegate, completion: completion)
    }

}
