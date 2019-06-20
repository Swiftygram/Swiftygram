//
//  TGClassContainer.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

class TGClassContainer {
    
    static let allClasses: [Any.Type] = [TGObject.Ok.self,
                                         TGObject.TdlibParameters.self,
                                         TGObject.TermsOfService.self,
                                         TGObject.Update.UpdateAuthorizationState.self]
    
    class func codableSubclasses<T>(for superclass: T.Type) -> [Codable.Type] {
        return allClasses.compactMap({ type in
            if type is T.Type, let codableType = type as? Codable.Type {
                return codableType
            }
            return nil
        })
    }
    
}
