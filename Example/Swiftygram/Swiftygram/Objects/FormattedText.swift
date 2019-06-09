//
//  FormattedText.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    // https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1formatted_text.html
    public class FormattedText: TGObjectProtocol {
        
        var text: String
        var entities: [TextEntity]

        public init(text: String, entities: [TextEntity]) {
            self.text = text
            self.entities = entities
        }
        
    }
    
}
