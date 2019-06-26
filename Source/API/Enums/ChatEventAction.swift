//
//  ChatEventAction.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a chat event
     */
    enum ChatEventAction: TDEnumProtocol {
        /**
         A message was edited

         - oldMessage: The original message before the edit
         - newMessage: The message after it was edited
         */
        case messageEdited(oldMessage: TDObject.Message, newMessage: TDObject.Message)

        /**
         A message was deleted

         - message: Deleted message
         */
        case messageDeleted(message: TDObject.Message)

        /**
         A message was pinned

         - message: Pinned message
         */
        case messagePinned(message: TDObject.Message)

        /**
         A message was unpinned
         */
        case messageUnpinned

        /**
         A new member joined the chat
         */
        case memberJoined

        /**
         A member left the chat
         */
        case memberLeft

        /**
         A new chat member was invited

         - userId: New member user identifier
         - status: New member status
         */
        case memberInvited(userId: Int, status: TDEnum.ChatMemberStatus)

        /**
         A chat member has gained/lost administrator status, or the list of their administrator privileges has changed

         - userId: Chat member user identifier
         - oldStatus: Previous status of the chat member
         - newStatus: New status of the chat member
         */
        case memberPromoted(userId: Int, oldStatus: TDEnum.ChatMemberStatus, newStatus: TDEnum.ChatMemberStatus)

        /**
         A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed

         - userId: Chat member user identifier
         - oldStatus: Previous status of the chat member
         - newStatus: New status of the chat member
         */
        case memberRestricted(userId: Int, oldStatus: TDEnum.ChatMemberStatus, newStatus: TDEnum.ChatMemberStatus)

        /**
         The chat title was changed

         - oldTitle: Previous chat title
         - newTitle: New chat title
         */
        case titleChanged(oldTitle: String, newTitle: String)

        /**
         The chat description was changed

         - oldDescription: Previous chat description
         - newDescription: New chat description
         */
        case descriptionChanged(oldDescription: String, newDescription: String)

        /**
         The chat username was changed

         - oldUsername: Previous chat username
         - newUsername: New chat username
         */
        case usernameChanged(oldUsername: String, newUsername: String)

        /**
         The chat photo was changed

         - oldPhoto: Previous chat photo value; may be null
         - newPhoto: New chat photo value; may be null
         */
        case photoChanged(oldPhoto: TDObject.ChatPhoto, newPhoto: TDObject.ChatPhoto)

        /**
         The anyone_can_invite setting of a supergroup chat was toggled

         - anyoneCanInvite: New value of anyone_can_invite
         */
        case invitesToggled(anyoneCanInvite: Bool)

        /**
         The sign_messages setting of a channel was toggled

         - signMessages: New value of sign_messages
         */
        case signMessagesToggled(signMessages: Bool)

        /**
         The supergroup sticker set was changed

         - oldStickerSetId: Previous identifier of the chat sticker set; 0 if none
         - newStickerSetId: New identifier of the chat sticker set; 0 if none
         */
        case stickerSetChanged(oldStickerSetId: Int64, newStickerSetId: Int64)

        /**
         The is_all_history_available setting of a supergroup was toggled

         - isAllHistoryAvailable: New value of is_all_history_available
         */
        case isAllHistoryAvailableToggled(isAllHistoryAvailable: Bool)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatEventMessageEdited":
                let oldMessage = try container.decode(TDObject.Message.self, forKey: .init(string: "oldMessage"))
                let newMessage = try container.decode(TDObject.Message.self, forKey: .init(string: "newMessage"))

                self = .messageEdited(oldMessage: oldMessage, newMessage: newMessage)

            case "chatEventMessageDeleted":
                let message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))

                self = .messageDeleted(message: message)

            case "chatEventMessagePinned":
                let message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))

                self = .messagePinned(message: message)

            case "chatEventMessageUnpinned":
                self = .messageUnpinned

            case "chatEventMemberJoined":
                self = .memberJoined

            case "chatEventMemberLeft":
                self = .memberLeft

            case "chatEventMemberInvited":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))
                let status = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "status"))

                self = .memberInvited(userId: userId, status: status)

            case "chatEventMemberPromoted":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))
                let oldStatus = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "oldStatus"))
                let newStatus = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "newStatus"))

                self = .memberPromoted(userId: userId, oldStatus: oldStatus, newStatus: newStatus)

            case "chatEventMemberRestricted":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))
                let oldStatus = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "oldStatus"))
                let newStatus = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "newStatus"))

                self = .memberRestricted(userId: userId, oldStatus: oldStatus, newStatus: newStatus)

            case "chatEventTitleChanged":
                let oldTitle = try container.decode(String.self, forKey: .init(string: "oldTitle"))
                let newTitle = try container.decode(String.self, forKey: .init(string: "newTitle"))

                self = .titleChanged(oldTitle: oldTitle, newTitle: newTitle)

            case "chatEventDescriptionChanged":
                let oldDescription = try container.decode(String.self, forKey: .init(string: "oldDescription"))
                let newDescription = try container.decode(String.self, forKey: .init(string: "newDescription"))

                self = .descriptionChanged(oldDescription: oldDescription, newDescription: newDescription)

            case "chatEventUsernameChanged":
                let oldUsername = try container.decode(String.self, forKey: .init(string: "oldUsername"))
                let newUsername = try container.decode(String.self, forKey: .init(string: "newUsername"))

                self = .usernameChanged(oldUsername: oldUsername, newUsername: newUsername)

            case "chatEventPhotoChanged":
                let oldPhoto = try container.decode(TDObject.ChatPhoto.self, forKey: .init(string: "oldPhoto"))
                let newPhoto = try container.decode(TDObject.ChatPhoto.self, forKey: .init(string: "newPhoto"))

                self = .photoChanged(oldPhoto: oldPhoto, newPhoto: newPhoto)

            case "chatEventInvitesToggled":
                let anyoneCanInvite = try container.decode(Bool.self, forKey: .init(string: "anyoneCanInvite"))

                self = .invitesToggled(anyoneCanInvite: anyoneCanInvite)

            case "chatEventSignMessagesToggled":
                let signMessages = try container.decode(Bool.self, forKey: .init(string: "signMessages"))

                self = .signMessagesToggled(signMessages: signMessages)

            case "chatEventStickerSetChanged":
                let oldStickerSetId = try container.decodeInt64(forKey: .init(string: "oldStickerSetId"))
                let newStickerSetId = try container.decodeInt64(forKey: .init(string: "newStickerSetId"))

                self = .stickerSetChanged(oldStickerSetId: oldStickerSetId, newStickerSetId: newStickerSetId)

            case "chatEventIsAllHistoryAvailableToggled":
                let isAllHistoryAvailable = try container.decode(Bool.self, forKey: .init(string: "isAllHistoryAvailable"))

                self = .isAllHistoryAvailableToggled(isAllHistoryAvailable: isAllHistoryAvailable)

            default:
                throw DecodingError.typeMismatch(ChatEventAction.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatEventAction"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .messageEdited(oldMessage, newMessage):
                try container.encode("chatEventMessageEdited", forKey: .type)

                try container.encode(oldMessage, forKey: .init(string: "oldMessage"))
                try container.encode(newMessage, forKey: .init(string: "newMessage"))

            case let .messageDeleted(message):
                try container.encode("chatEventMessageDeleted", forKey: .type)

                try container.encode(message, forKey: .init(string: "message"))

            case let .messagePinned(message):
                try container.encode("chatEventMessagePinned", forKey: .type)

                try container.encode(message, forKey: .init(string: "message"))

            case .messageUnpinned:
                try container.encode("chatEventMessageUnpinned", forKey: .type)

            case .memberJoined:
                try container.encode("chatEventMemberJoined", forKey: .type)

            case .memberLeft:
                try container.encode("chatEventMemberLeft", forKey: .type)

            case let .memberInvited(userId, status):
                try container.encode("chatEventMemberInvited", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))
                try container.encode(status, forKey: .init(string: "status"))

            case let .memberPromoted(userId, oldStatus, newStatus):
                try container.encode("chatEventMemberPromoted", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))
                try container.encode(oldStatus, forKey: .init(string: "oldStatus"))
                try container.encode(newStatus, forKey: .init(string: "newStatus"))

            case let .memberRestricted(userId, oldStatus, newStatus):
                try container.encode("chatEventMemberRestricted", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))
                try container.encode(oldStatus, forKey: .init(string: "oldStatus"))
                try container.encode(newStatus, forKey: .init(string: "newStatus"))

            case let .titleChanged(oldTitle, newTitle):
                try container.encode("chatEventTitleChanged", forKey: .type)

                try container.encode(oldTitle, forKey: .init(string: "oldTitle"))
                try container.encode(newTitle, forKey: .init(string: "newTitle"))

            case let .descriptionChanged(oldDescription, newDescription):
                try container.encode("chatEventDescriptionChanged", forKey: .type)

                try container.encode(oldDescription, forKey: .init(string: "oldDescription"))
                try container.encode(newDescription, forKey: .init(string: "newDescription"))

            case let .usernameChanged(oldUsername, newUsername):
                try container.encode("chatEventUsernameChanged", forKey: .type)

                try container.encode(oldUsername, forKey: .init(string: "oldUsername"))
                try container.encode(newUsername, forKey: .init(string: "newUsername"))

            case let .photoChanged(oldPhoto, newPhoto):
                try container.encode("chatEventPhotoChanged", forKey: .type)

                try container.encode(oldPhoto, forKey: .init(string: "oldPhoto"))
                try container.encode(newPhoto, forKey: .init(string: "newPhoto"))

            case let .invitesToggled(anyoneCanInvite):
                try container.encode("chatEventInvitesToggled", forKey: .type)

                try container.encode(anyoneCanInvite, forKey: .init(string: "anyoneCanInvite"))

            case let .signMessagesToggled(signMessages):
                try container.encode("chatEventSignMessagesToggled", forKey: .type)

                try container.encode(signMessages, forKey: .init(string: "signMessages"))

            case let .stickerSetChanged(oldStickerSetId, newStickerSetId):
                try container.encode("chatEventStickerSetChanged", forKey: .type)

                try container.encodeInt64(oldStickerSetId, forKey: .init(string: "oldStickerSetId"))
                try container.encodeInt64(newStickerSetId, forKey: .init(string: "newStickerSetId"))

            case let .isAllHistoryAvailableToggled(isAllHistoryAvailable):
                try container.encode("chatEventIsAllHistoryAvailableToggled", forKey: .type)

                try container.encode(isAllHistoryAvailable, forKey: .init(string: "isAllHistoryAvailable"))
            }
        }
    }
}
