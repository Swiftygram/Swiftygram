//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Provides information about a bot and its supported commands
     */
    struct BotInfo: TDObjectProtocol {
        /**
         Long description shown on the user info page
         */
        public var description: String

        /**
         A list of commands supported by the bot
         */
        public var commands: [TDObject.BotCommand]

        /**
         Provides information about a bot and its supported commands

         - Parameter description: Long description shown on the user info page
         - Parameter commands: A list of commands supported by the bot
         */
        public init(description: String, commands: [TDObject.BotCommand]) {
            self.description = description
            self.commands = commands
        }
    }
}
