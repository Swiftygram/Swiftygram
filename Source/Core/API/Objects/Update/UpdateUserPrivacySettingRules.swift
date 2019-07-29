//
//  UpdateUserPrivacySettingRules.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some privacy setting rules have been changed
     */
    struct UpdateUserPrivacySettingRules: TDObject.Update {
        /**
         The privacy setting
         */
        public var setting: TDEnum.UserPrivacySetting

        /**
         New privacy rules
         */
        public var rules: TDObject.UserPrivacySettingRules

        /**
         Some privacy setting rules have been changed

         - Parameter setting: The privacy setting
         - Parameter rules: New privacy rules
         */
        public init(setting: TDEnum.UserPrivacySetting, rules: TDObject.UserPrivacySettingRules) {
            self.setting = setting
            self.rules = rules
        }
    }
}
