//
//  ChatEventLogFilters.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a set of filters used to obtain a chat event log
     */
    struct ChatEventLogFilters: TDObjectProtocol {
        /**
         True, if message edits should be returned
         */
        public let messageEdits: Bool

        /**
         True, if message deletions should be returned
         */
        public let messageDeletions: Bool

        /**
         True, if pin/unpin events should be returned
         */
        public let messagePins: Bool

        /**
         True, if members joining events should be returned
         */
        public let memberJoins: Bool

        /**
         True, if members leaving events should be returned
         */
        public let memberLeaves: Bool

        /**
         True, if invited member events should be returned
         */
        public let memberInvites: Bool

        /**
         True, if member promotion/demotion events should be returned
         */
        public let memberPromotions: Bool

        /**
         True, if member restricted/unrestricted/banned/unbanned events should be returned
         */
        public let memberRestrictions: Bool

        /**
         True, if changes in chat information should be returned
         */
        public let infoChanges: Bool

        /**
         True, if changes in chat settings should be returned
         */
        public let settingChanges: Bool

        /**
         Represents a set of filters used to obtain a chat event log

         - Parameter messageEdits: True, if message edits should be returned
         - Parameter messageDeletions: True, if message deletions should be returned
         - Parameter messagePins: True, if pin/unpin events should be returned
         - Parameter memberJoins: True, if members joining events should be returned
         - Parameter memberLeaves: True, if members leaving events should be returned
         - Parameter memberInvites: True, if invited member events should be returned
         - Parameter memberPromotions: True, if member promotion/demotion events should be returned
         - Parameter memberRestrictions: True, if member restricted/unrestricted/banned/unbanned events should be returned
         - Parameter infoChanges: True, if changes in chat information should be returned
         - Parameter settingChanges: True, if changes in chat settings should be returned
         */
        public init(messageEdits: Bool, messageDeletions: Bool, messagePins: Bool, memberJoins: Bool, memberLeaves: Bool, memberInvites: Bool, memberPromotions: Bool, memberRestrictions: Bool, infoChanges: Bool, settingChanges: Bool) {
            self.messageEdits = messageEdits
            self.messageDeletions = messageDeletions
            self.messagePins = messagePins
            self.memberJoins = memberJoins
            self.memberLeaves = memberLeaves
            self.memberInvites = memberInvites
            self.memberPromotions = memberPromotions
            self.memberRestrictions = memberRestrictions
            self.infoChanges = infoChanges
            self.settingChanges = settingChanges
        }
    }
}
