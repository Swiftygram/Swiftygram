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
        if let countryName = Locale.current.localizedString(forRegionCode: countryCode) {
            return countryName
        } else {
            return defaultCountryName
        }
    }()
    
}
