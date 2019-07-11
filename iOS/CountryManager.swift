//
//  CountryManager.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/11/19.
//

import Foundation

class CountryManager {
    
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
    
    let allCountries: [CountryInfo] = {
        guard let url = Bundle.swiftygram.url(forResource: "CountryInfo", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let countries = try? PropertyListDecoder().decode([CountryInfo].self, from: data) else {
                return []
        }
        
        countries.forEach { _ = $0.localizedCountryName }
        
        return countries
    }()
    
}
