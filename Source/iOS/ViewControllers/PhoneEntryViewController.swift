//
//  PhoneEntryViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit

class PhoneEntryViewController: AuthorizationBaseViewController<PhoneEntryView> {

    private let countryManager: CountryManager
    private let authorizerSession: TDAuthorizerSession
    
    init(countryManager: CountryManager, authorizerSession: TDAuthorizerSession) {
        self.countryManager = countryManager
        self.authorizerSession = authorizerSession
        
        super.init(contentView: .instantiateFromNib(), isFinalStep: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
