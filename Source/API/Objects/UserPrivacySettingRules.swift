//
//  UserPrivacySettingRules.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed
     */
    struct UserPrivacySettingRules: TDObjectProtocol {
        /**
         A list of rules
         */
        public let rules: [TDEnum.UserPrivacySettingRule]

        /**
         A list of privacy rules. Rules are matched in the specified order. The first matched rule defines the privacy setting for a given user. If no rule matches, the action is not allowed

         - Parameter rules: A list of rules
         */
        public init(rules: [TDEnum.UserPrivacySettingRule]) {
            self.rules = rules
        }
    }
}
