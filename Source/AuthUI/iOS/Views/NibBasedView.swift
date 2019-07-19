//
//  NibBasedView.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit

protocol NibBasedView {
}

extension NibBasedView {
    
    static func instantiateFromNib() -> Self {
        return UINib(nibName: String(describing: self), bundle: .swiftygram).instantiate(withOwner: nil, options: nil)[0] as! Self
    }
    
}
