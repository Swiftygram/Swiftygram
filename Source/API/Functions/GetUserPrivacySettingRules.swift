//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the current privacy settings

     - ReturnType: `TDObject.UserPrivacySettingRules`
     */
    struct GetUserPrivacySettingRules: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.UserPrivacySettingRules

        /**
         The privacy setting
         */
        public var setting: TDEnum.UserPrivacySetting

        /**
         Returns the current privacy settings

         - Parameter setting: The privacy setting
         */
        public init(setting: TDEnum.UserPrivacySetting) {
            self.setting = setting
        }
    }
}
