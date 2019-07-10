//
//  SecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a secret chat
     */
    struct SecretChat: TDObjectProtocol {
        /**
         Secret chat identifier
         */
        public var id: Int

        /**
         Identifier of the chat partner
         */
        public var userId: Int

        /**
         State of the secret chat
         */
        public var state: TDEnum.SecretChatState

        /**
         True, if the chat was created by the current user; otherwise false
         */
        public var isOutbound: Bool

        /**
         Current message Time To Live setting (self-destruct timer) for the chat, in seconds
         */
        public var ttl: Int

        /**
         Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 bytes, which must be used to make a 12x12 square image with a color depth of 4. The first 16 bytes should be used to make a central 8x8 square, while the remaining 20 bytes should be used to construct a 2-pixel-wide border around that square.-Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
         */
        public var keyHash: String

        /**
         Secret chat layer; determines features supported by the other client. Video notes are supported if the layer >= 66
         */
        public var layer: Int

        /**
         Represents a secret chat

         - Parameter id: Secret chat identifier
         - Parameter userId: Identifier of the chat partner
         - Parameter state: State of the secret chat
         - Parameter isOutbound: True, if the chat was created by the current user; otherwise false
         - Parameter ttl: Current message Time To Live setting (self-destruct timer) for the chat, in seconds
         - Parameter keyHash: Hash of the currently used key for comparison with the hash of the chat partner's key. This is a string of 36 bytes, which must be used to make a 12x12 square image with a color depth of 4. The first 16 bytes should be used to make a central 8x8 square, while the remaining 20 bytes should be used to construct a 2-pixel-wide border around that square.-Alternatively, the first 32 bytes of the hash can be converted to the hexadecimal format and printed as 32 2-digit hex numbers
         - Parameter layer: Secret chat layer; determines features supported by the other client. Video notes are supported if the layer >= 66
         */
        public init(id: Int, userId: Int, state: TDEnum.SecretChatState, isOutbound: Bool, ttl: Int, keyHash: String, layer: Int) {
            self.id = id
            self.userId = userId
            self.state = state
            self.isOutbound = isOutbound
            self.ttl = ttl
            self.keyHash = keyHash
            self.layer = layer
        }
    }
}
