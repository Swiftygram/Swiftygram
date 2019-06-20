//
//  UpdateAuthorizationState.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    // https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1update_authorization_state.html
    public class UpdateAuthorizationState: UpdateProtocol {
        
        var authorizationState: TGEnum.AuthorizationState

        public init(authorizationState: TGEnum.AuthorizationState) {
            self.authorizationState = authorizationState
        }
        
    }
    
}
