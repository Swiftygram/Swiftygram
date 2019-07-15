//
//  CountryInfo.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/11/19.
//

import Foundation

class CountryInfo: Codable {
    
    let phoneCode: String
    let countryCode: String
    let defaultCountryName: String

    private(set) lazy var localizedCountryName: String = {
        if let countryName = Locale.swiftygram.localizedString(forRegionCode: countryCode) {
            return countryName
        } else {
            return defaultCountryName
        }
    }()
    
    private(set) lazy var emojiFlag: String = {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }()
    
    var displayedName: String {
        return localizedCountryName
    }
    
    init(phoneCode: String, countryCode: String, defaultCountryName: String) {
        self.phoneCode = phoneCode
        self.countryCode = countryCode
        self.defaultCountryName = defaultCountryName
        
        _ = localizedCountryName
        _ = emojiFlag
    }
    
}
