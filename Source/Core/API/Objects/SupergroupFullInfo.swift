//
//  SupergroupFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains full information about a supergroup or channel
     */
    struct SupergroupFullInfo: TDObjectProtocol {
        /**
         Supergroup or channel description
         */
        public var description: String

        /**
         Number of members in the supergroup or channel; 0 if unknown
         */
        public var memberCount: Int

        /**
         Number of privileged users in the supergroup or channel; 0 if unknown
         */
        public var administratorCount: Int

        /**
         Number of restricted users in the supergroup; 0 if unknown
         */
        public var restrictedCount: Int

        /**
         Number of users banned from chat; 0 if unknown
         */
        public var bannedCount: Int

        /**
         True, if members of the chat can be retrieved
         */
        public var canGetMembers: Bool

        /**
         True, if the chat can be made public
         */
        public var canSetUsername: Bool

        /**
         True, if the supergroup sticker set can be changed
         */
        public var canSetStickerSet: Bool

        /**
         True, if the channel statistics is available through getChatStatisticsUrl
         */
        public var canViewStatistics: Bool

        /**
         True, if new chat members will have access to old messages. In public supergroups and both public and private channels, old messages are always available, so this option affects only private supergroups. The value of this field is only available for chat administrators
         */
        public var isAllHistoryAvailable: Bool

        /**
         Identifier of the supergroup sticker set; 0 if none
         */
        public var stickerSetId: Int64

        /**
         Invite link for this chat
         */
        public var inviteLink: String

        /**
         Identifier of the basic group from which supergroup was upgraded; 0 if none
         */
        public var upgradedFromBasicGroupId: Int

        /**
         Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
         */
        public var upgradedFromMaxMessageId: Int64

        /**
         Contains full information about a supergroup or channel

         - Parameter description: Supergroup or channel description
         - Parameter memberCount: Number of members in the supergroup or channel; 0 if unknown
         - Parameter administratorCount: Number of privileged users in the supergroup or channel; 0 if unknown
         - Parameter restrictedCount: Number of restricted users in the supergroup; 0 if unknown
         - Parameter bannedCount: Number of users banned from chat; 0 if unknown
         - Parameter canGetMembers: True, if members of the chat can be retrieved
         - Parameter canSetUsername: True, if the chat can be made public
         - Parameter canSetStickerSet: True, if the supergroup sticker set can be changed
         - Parameter canViewStatistics: True, if the channel statistics is available through getChatStatisticsUrl
         - Parameter isAllHistoryAvailable: True, if new chat members will have access to old messages. In public supergroups and both public and private channels, old messages are always available, so this option affects only private supergroups. The value of this field is only available for chat administrators
         - Parameter stickerSetId: Identifier of the supergroup sticker set; 0 if none
         - Parameter inviteLink: Invite link for this chat
         - Parameter upgradedFromBasicGroupId: Identifier of the basic group from which supergroup was upgraded; 0 if none
         - Parameter upgradedFromMaxMessageId: Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
         */
        public init(description: String, memberCount: Int, administratorCount: Int, restrictedCount: Int, bannedCount: Int, canGetMembers: Bool, canSetUsername: Bool, canSetStickerSet: Bool, canViewStatistics: Bool, isAllHistoryAvailable: Bool, stickerSetId: Int64, inviteLink: String, upgradedFromBasicGroupId: Int, upgradedFromMaxMessageId: Int64) {
            self.description = description
            self.memberCount = memberCount
            self.administratorCount = administratorCount
            self.restrictedCount = restrictedCount
            self.bannedCount = bannedCount
            self.canGetMembers = canGetMembers
            self.canSetUsername = canSetUsername
            self.canSetStickerSet = canSetStickerSet
            self.canViewStatistics = canViewStatistics
            self.isAllHistoryAvailable = isAllHistoryAvailable
            self.stickerSetId = stickerSetId
            self.inviteLink = inviteLink
            self.upgradedFromBasicGroupId = upgradedFromBasicGroupId
            self.upgradedFromMaxMessageId = upgradedFromMaxMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            description = try container.decode(String.self, forKey: .init(string: "description"))
            memberCount = try container.decode(Int.self, forKey: .init(string: "memberCount"))
            administratorCount = try container.decode(Int.self, forKey: .init(string: "administratorCount"))
            restrictedCount = try container.decode(Int.self, forKey: .init(string: "restrictedCount"))
            bannedCount = try container.decode(Int.self, forKey: .init(string: "bannedCount"))
            canGetMembers = try container.decode(Bool.self, forKey: .init(string: "canGetMembers"))
            canSetUsername = try container.decode(Bool.self, forKey: .init(string: "canSetUsername"))
            canSetStickerSet = try container.decode(Bool.self, forKey: .init(string: "canSetStickerSet"))
            canViewStatistics = try container.decode(Bool.self, forKey: .init(string: "canViewStatistics"))
            isAllHistoryAvailable = try container.decode(Bool.self, forKey: .init(string: "isAllHistoryAvailable"))
            stickerSetId = try container.decodeInt64(forKey: .init(string: "stickerSetId"))
            inviteLink = try container.decode(String.self, forKey: .init(string: "inviteLink"))
            upgradedFromBasicGroupId = try container.decode(Int.self, forKey: .init(string: "upgradedFromBasicGroupId"))
            upgradedFromMaxMessageId = try container.decodeInt64(forKey: .init(string: "upgradedFromMaxMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(description, forKey: .init(string: "description"))
            try container.encode(memberCount, forKey: .init(string: "memberCount"))
            try container.encode(administratorCount, forKey: .init(string: "administratorCount"))
            try container.encode(restrictedCount, forKey: .init(string: "restrictedCount"))
            try container.encode(bannedCount, forKey: .init(string: "bannedCount"))
            try container.encode(canGetMembers, forKey: .init(string: "canGetMembers"))
            try container.encode(canSetUsername, forKey: .init(string: "canSetUsername"))
            try container.encode(canSetStickerSet, forKey: .init(string: "canSetStickerSet"))
            try container.encode(canViewStatistics, forKey: .init(string: "canViewStatistics"))
            try container.encode(isAllHistoryAvailable, forKey: .init(string: "isAllHistoryAvailable"))
            try container.encodeInt64(stickerSetId, forKey: .init(string: "stickerSetId"))
            try container.encode(inviteLink, forKey: .init(string: "inviteLink"))
            try container.encode(upgradedFromBasicGroupId, forKey: .init(string: "upgradedFromBasicGroupId"))
            try container.encodeInt64(upgradedFromMaxMessageId, forKey: .init(string: "upgradedFromMaxMessageId"))
        }
    }
}
