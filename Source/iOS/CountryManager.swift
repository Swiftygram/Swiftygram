//
//  CountryManager.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/11/19.
//

import Foundation
import CoreTelephony

class CountryManager {
    
    static let unitedStates = CountryInfo(phoneCode: "1", countryCode: "US", defaultCountryName: "United States")
    
    static let shared = CountryManager()
    
    class func load(with completionHandler: ((CountryManager) -> ())?) {
        DispatchQueue.global().async {
            let manager = shared
            
            guard let completionHandler = completionHandler else { return }
            
            DispatchQueue.main.async {
                completionHandler(manager)
            }
        }
    }
    
    private let phoneCodeCountryInfo: [String: CountryInfo]
    private let countryCodeCountryInfo: [String: CountryInfo]
    
    let allCountries: [CountryInfo] = {
        let countries: [CountryInfo]
        
        if let url = Bundle.swiftygram.url(forResource: "CountryInfo", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let array = try? PropertyListDecoder().decode([CountryInfo].self, from: data) {
            countries = array
        } else {
            countries = [CountryManager.unitedStates]
        }
        
        countries.forEach {
            _ = $0.localizedCountryName
            _ = $0.emojiFlag
        }
        
        return countries
    }()
    
    private(set) lazy var defaultCountry: CountryInfo = {
        var countryCode: String?
        
        let networkInfo = CTTelephonyNetworkInfo()
        if let carrier = networkInfo.subscriberCellularProvider {
            countryCode = carrier.isoCountryCode
        }
        
        if countryCode == nil {
            countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String
        }

        guard let code = countryCode else {
            return CountryManager.unitedStates
        }
        
        return infoForCountryCode(code)
    }()
    
    private init() {
        var phoneCodeCountryInfo = [String: CountryInfo]()
        var countryCodeCountryInfo = [String: CountryInfo]()
            
        allCountries.forEach {
            phoneCodeCountryInfo[$0.phoneCode] = $0
            countryCodeCountryInfo[$0.countryCode] = $0
        }
        
        self.phoneCodeCountryInfo = phoneCodeCountryInfo
        self.countryCodeCountryInfo = countryCodeCountryInfo
    }
    
    func infoForCountryCode(_ countryCode: String) -> CountryInfo {
        return countryCodeCountryInfo[countryCode.uppercased()] ?? CountryManager.unitedStates
    }
    
    func infoForPhoneCode(_ phoneCode: String) -> CountryInfo? {
        return phoneCodeCountryInfo[phoneCode]
    }
    
}
