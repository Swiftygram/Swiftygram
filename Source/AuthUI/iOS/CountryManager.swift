//
//  CountryManager.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/11/19.
//

import Foundation
import CoreTelephony
import libPhoneNumber_iOS

private typealias PhoneCodeTree = [String: Any]

class CountryManager {
    
    static let shared = CountryManager()
    
    class func load(with completionHandler: ((CountryManager) -> ())?) {
        DispatchQueue.global().async {
            // optimization
            _ = NBPhoneNumberUtil.sharedInstance()
            _ = NBMetadataHelper.cCode2CNMap()
            
            let manager = shared

            guard let completionHandler = completionHandler else { return }
            
            DispatchQueue.main.async {
                completionHandler(manager)
            }
        }
    }
    
    private let phoneCodeCountryInfo: [String: CountryInfo]
    private let countryCodeCountryInfo: [String: CountryInfo]
    private let phoneCodeTree: PhoneCodeTree
    
    let allCountries: [CountryInfo] = {
        let countries: [CountryInfo]
        
        if let url = Bundle.swiftygram.url(forResource: "CountryInfo", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let array = try? PropertyListDecoder().decode([CountryInfo].self, from: data) {
            countries = array
        } else {
            countries = [.unitedStates]
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
            return .unitedStates
        }
        
        return infoForCountryCode(code) ?? .unitedStates
    }()
    
    private init() {
        var phoneCodeCountryInfo = [String: CountryInfo]()
        var countryCodeCountryInfo = [String: CountryInfo]()
            
        allCountries.forEach {
            phoneCodeCountryInfo[$0.phoneCode] = $0
            countryCodeCountryInfo[$0.countryCode] = $0
        }
        
        phoneCodeCountryInfo["1"] = countryCodeCountryInfo["US"]
        phoneCodeCountryInfo["7"] = countryCodeCountryInfo["RU"]
        
        self.phoneCodeCountryInfo = phoneCodeCountryInfo
        self.countryCodeCountryInfo = countryCodeCountryInfo
        phoneCodeTree = type(of: self).phoneCodeTree(for: allCountries)
    }
    
    private class func phoneCodeTree(for countries: [CountryInfo]) -> PhoneCodeTree {
        let time = Date(); defer { print(#function, -time.timeIntervalSinceNow) }
        
        let tree = NSMutableDictionary()
        
        for country in countries {
            var nextBranch = tree
            
            for digit in country.phoneCode {
                let digit = String(digit)
                
                var branch = nextBranch[digit] as? NSMutableDictionary
                if branch == nil {
                    branch = NSMutableDictionary()
                    nextBranch[digit] = branch
                }
                nextBranch = branch!
            }
            
            if country.phoneCode == "1" || country.phoneCode == "7" {
                if country.countryCode == "US" || country.countryCode == "RU" {
                    nextBranch["country"] = country
                }
            } else {
                nextBranch["country"] = country
            }
        }
        
        return tree as! PhoneCodeTree
    }
    
    func infoForCountryCode(_ countryCode: String) -> CountryInfo? {
        return countryCodeCountryInfo[countryCode.uppercased()]
    }
    
    func infoForPhoneCode(_ phoneCode: String) -> CountryInfo? {
        return phoneCodeCountryInfo[phoneCode]
    }
    
    func infoForPhoneNumber(_ phoneNumber: String) -> CountryInfo? {
        let time = Date(); defer { print(#function, -time.timeIntervalSinceNow) }
        
//        var previousCountry: CountryInfo?
        var nextTree = phoneCodeTree
        
        for digit in phoneNumber {
            let digit = String(digit)
            
            guard let tree = nextTree[digit] as? PhoneCodeTree else {
                break
            }
            nextTree = tree
            
            if let country = tree["country"] as? CountryInfo {
                return country
            }
        }
        
        return nil
        
//        guard let country = previousCountry else {
//            return nil
//        }
//
//        // use libPhoneNumber to resove i.e. US or CA
//        do {
//            let phoneNumberUtil = NBPhoneNumberUtil.sharedInstance()!
//
//            let number = try phoneNumberUtil.parse(phoneNumber, defaultRegion: country.countryCode)
//
//            if let countryCode = phoneNumberUtil.getRegionCode(for: number),
//                let country = infoForCountryCode(countryCode) {
//                return country
//            } else {
//                return country
//            }
//        }
//        catch {
//            return country
//        }
    }
    
}
