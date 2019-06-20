//
//  TermsOfService.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    // https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1terms_of_service.html
    public class TermsOfService: TGObjectProtocol {
        
        var text: FormattedText
        var minUserAge: Int
        var showPopup: Bool

        public init(text: FormattedText, minUserAge: Int, showPopup: Bool) {
            self.text = text
            self.minUserAge = minUserAge
            self.showPopup = showPopup
        }
        
    }
    
}
