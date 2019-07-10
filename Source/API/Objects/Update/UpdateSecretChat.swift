//
//  UpdateSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the client
     */
    struct UpdateSecretChat: TDObject.Update {
        /**
         New data about the secret chat
         */
        public var secretChat: TDObject.SecretChat

        /**
         Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the client

         - Parameter secretChat: New data about the secret chat
         */
        public init(secretChat: TDObject.SecretChat) {
            self.secretChat = secretChat
        }
    }
}
