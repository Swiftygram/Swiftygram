//
//  TDClient+Configuration.swift
//  Pods-Swiftygram Example
//
//  Created by Oleksandr Zhuhan on 7/8/19.
//

import Foundation

private func getSystemLanguageCode() -> String {
    return Locale.preferredLanguages.first ?? "en"
}

private func getDeviceModel() -> String {
    #if targetEnvironment(simulator)
    if let simulatorModel = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
        return simulatorModel
    }
    
    #if os(iOS)
    return "iPhone"
    #elseif os(tvOS)
    return "Apple TV"
    #elseif os(watchOS)
    return "Apple Watch"
    #elseif os(macOS)
    return "iMac"
    #else
    return "Unknown"
    #endif
    
    #else
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    return identifier
    #endif
}

private func getSystemVersion() -> String {
    let version = ProcessInfo.processInfo.operatingSystemVersion
    
    var result = "\(version.majorVersion).\(version.minorVersion)"
    if version.patchVersion > 0 {
        result += ".\(version.patchVersion)"
    }
    
    return result
}

private func getApplicationVersion() -> String {
    return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "1.4.0"
}

public extension TDClient {
    struct Configuration {
        
        public static let `default` = Configuration(usesFileDatabase: true,
                                                    usesChatInfoDatabase: true,
                                                    usesMessageDatabase: false,
                                                    usesSecretChats: false,
                                                    enableStorageOptimizer: true,
                                                    ignoresFileNames: true)
        
        /**
         If set to true, information about downloaded and uploaded files will be saved between application restarts
         */
        public var usesFileDatabase: Bool
        
        /**
         If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
         */
        public var usesChatInfoDatabase: Bool
        
        /**
         If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
         */
        public var usesMessageDatabase: Bool
        
        /**
         If set to true, support for secret chats will be enabled
         */
        public var usesSecretChats: Bool
        
        /**
         If set to true, old files will automatically be deleted
         */
        public var enableStorageOptimizer: Bool
        
        public var timeoutInterval: TimeInterval
        
        /**
         If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
         */
        public var ignoresFileNames: Bool
        
        /**
         IETF language tag of the user's operating system language; must be non-empty
         */
        public var systemLanguageCode: String
        
        /**
         Model of the device the application is being run on; must be non-empty
         */
        public var deviceModel: String
        
        /**
         Version of the operating system the application is being run on; must be non-empty
         */
        public var systemVersion: String
        
        /**
         Application version; must be non-empty
         */
        public var applicationVersion: String
        
        public init(usesFileDatabase: Bool,
                    usesChatInfoDatabase: Bool,
                    usesMessageDatabase: Bool,
                    usesSecretChats: Bool,
                    enableStorageOptimizer: Bool,
                    ignoresFileNames: Bool,
                    timeoutInterval: TimeInterval = 20) {

            self.init(usesFileDatabase: usesFileDatabase,
                      usesChatInfoDatabase: usesChatInfoDatabase,
                      usesMessageDatabase: usesMessageDatabase,
                      usesSecretChats: usesSecretChats,
                      enableStorageOptimizer: enableStorageOptimizer,
                      ignoresFileNames: ignoresFileNames,
                      timeoutInterval: timeoutInterval,
                      systemLanguageCode: getSystemLanguageCode(),
                      deviceModel: getDeviceModel(),
                      systemVersion: getSystemVersion(),
                      applicationVersion: getApplicationVersion())
        }

        public init(usesFileDatabase: Bool,
                    usesChatInfoDatabase: Bool,
                    usesMessageDatabase: Bool,
                    usesSecretChats: Bool,
                    enableStorageOptimizer: Bool,
                    ignoresFileNames: Bool,
                    timeoutInterval: TimeInterval,
                    systemLanguageCode: String,
                    deviceModel: String,
                    systemVersion: String,
                    applicationVersion: String) {
            
            self.usesFileDatabase = usesFileDatabase
            self.usesChatInfoDatabase = usesChatInfoDatabase
            self.usesMessageDatabase = usesMessageDatabase
            self.usesSecretChats = usesSecretChats
            self.enableStorageOptimizer = enableStorageOptimizer
            self.ignoresFileNames = ignoresFileNames
            self.timeoutInterval = timeoutInterval
            self.systemLanguageCode = systemLanguageCode
            self.deviceModel = deviceModel
            self.systemVersion = systemVersion
            self.applicationVersion = applicationVersion
        }
        
    }
}
