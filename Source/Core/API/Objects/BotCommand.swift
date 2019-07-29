//
//  BotCommand.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents commands supported by a bot
     */
    struct BotCommand: TDObjectProtocol {
        /**
         Text of the bot command
         */
        public var command: String

        /**
         Description of the bot command
         */
        public var description: String

        /**
         Represents commands supported by a bot

         - Parameter command: Text of the bot command
         - Parameter description: Description of the bot command
         */
        public init(command: String, description: String) {
            self.command = command
            self.description = description
        }
    }
}
