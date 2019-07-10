//
//  TdlibParameters.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDObject {
    /**
     Contains parameters for TDLib initialization
     */
    struct TdlibParameters: TDObjectProtocol {
        /**
         If set to true, the Telegram test environment will be used instead of the production environment
         */
        public var useTestDc: Bool

        /**
         The path to the directory for the persistent database; if empty, the current working directory will be used
         */
        public var databaseDirectory: String

        /**
         The path to the directory for storing files; if empty, database_directory will be used
         */
        public var filesDirectory: String

        /**
         If set to true, information about downloaded and uploaded files will be saved between application restarts
         */
        public var useFileDatabase: Bool

        /**
         If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
         */
        public var useChatInfoDatabase: Bool

        /**
         If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
         */
        public var useMessageDatabase: Bool

        /**
         If set to true, support for secret chats will be enabled
         */
        public var useSecretChats: Bool

        /**
         Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
         */
        public var apiId: Int

        /**
         Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
         */
        public var apiHash: String

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

        /**
         If set to true, old files will automatically be deleted
         */
        public var enableStorageOptimizer: Bool

        /**
         If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
         */
        public var ignoreFileNames: Bool

        /**
         Contains parameters for TDLib initialization

         - Parameter useTestDc: If set to true, the Telegram test environment will be used instead of the production environment
         - Parameter databaseDirectory: The path to the directory for the persistent database; if empty, the current working directory will be used
         - Parameter filesDirectory: The path to the directory for storing files; if empty, database_directory will be used
         - Parameter useFileDatabase: If set to true, information about downloaded and uploaded files will be saved between application restarts
         - Parameter useChatInfoDatabase: If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
         - Parameter useMessageDatabase: If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
         - Parameter useSecretChats: If set to true, support for secret chats will be enabled
         - Parameter apiId: Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
         - Parameter apiHash: Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
         - Parameter systemLanguageCode: IETF language tag of the user's operating system language; must be non-empty
         - Parameter deviceModel: Model of the device the application is being run on; must be non-empty
         - Parameter systemVersion: Version of the operating system the application is being run on; must be non-empty
         - Parameter applicationVersion: Application version; must be non-empty
         - Parameter enableStorageOptimizer: If set to true, old files will automatically be deleted
         - Parameter ignoreFileNames: If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
         */
        public init(useTestDc: Bool, databaseDirectory: String, filesDirectory: String, useFileDatabase: Bool, useChatInfoDatabase: Bool, useMessageDatabase: Bool, useSecretChats: Bool, apiId: Int, apiHash: String, systemLanguageCode: String, deviceModel: String, systemVersion: String, applicationVersion: String, enableStorageOptimizer: Bool, ignoreFileNames: Bool) {
            self.useTestDc = useTestDc
            self.databaseDirectory = databaseDirectory
            self.filesDirectory = filesDirectory
            self.useFileDatabase = useFileDatabase
            self.useChatInfoDatabase = useChatInfoDatabase
            self.useMessageDatabase = useMessageDatabase
            self.useSecretChats = useSecretChats
            self.apiId = apiId
            self.apiHash = apiHash
            self.systemLanguageCode = systemLanguageCode
            self.deviceModel = deviceModel
            self.systemVersion = systemVersion
            self.applicationVersion = applicationVersion
            self.enableStorageOptimizer = enableStorageOptimizer
            self.ignoreFileNames = ignoreFileNames
        }
    }
}
