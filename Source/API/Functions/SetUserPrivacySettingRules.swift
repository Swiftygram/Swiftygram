//
//  SetUserPrivacySettingRules.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes user privacy settings

     - ReturnType: `TDObject.Ok`
     */
    struct SetUserPrivacySettingRules: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The privacy setting
         */
        public let setting: TDEnum.UserPrivacySetting

        /**
         The new privacy rules
         */
        public let rules: TDObject.UserPrivacySettingRules

        /**
         Changes user privacy settings

         - Parameter setting: The privacy setting
         - Parameter rules: The new privacy rules
         */
        public init(setting: TDEnum.UserPrivacySetting, rules: TDObject.UserPrivacySettingRules) {
            self.setting = setting
            self.rules = rules
        }
    }
}
