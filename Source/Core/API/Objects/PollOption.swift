//
//  PollOption.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes one answer option of a poll
     */
    struct PollOption: TDObjectProtocol {
        /**
         Option text, 1-100 characters
         */
        public var text: String

        /**
         Number of voters for this option, available only for closed or voted polls
         */
        public var voterCount: Int

        /**
         The percentage of votes for this option, 0-100
         */
        public var votePercentage: Int

        /**
         True, if the option was chosen by the user
         */
        public var isChosen: Bool

        /**
         True, if the option is being chosen by a pending setPollAnswer request
         */
        public var isBeingChosen: Bool

        /**
         Describes one answer option of a poll

         - Parameter text: Option text, 1-100 characters
         - Parameter voterCount: Number of voters for this option, available only for closed or voted polls
         - Parameter votePercentage: The percentage of votes for this option, 0-100
         - Parameter isChosen: True, if the option was chosen by the user
         - Parameter isBeingChosen: True, if the option is being chosen by a pending setPollAnswer request
         */
        public init(text: String, voterCount: Int, votePercentage: Int, isChosen: Bool, isBeingChosen: Bool) {
            self.text = text
            self.voterCount = voterCount
            self.votePercentage = votePercentage
            self.isChosen = isChosen
            self.isBeingChosen = isBeingChosen
        }
    }
}
