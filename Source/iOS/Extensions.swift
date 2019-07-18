//
//  Extensions.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/15/19.
//

import Foundation

extension Locale {
    static let swiftygram = Locale(identifier: L.locale)
}

extension UIImage {
    convenience init?(frameworkNamed named: String) {
        self.init(named: named, in: .swiftygram, compatibleWith: nil)
    }
}
