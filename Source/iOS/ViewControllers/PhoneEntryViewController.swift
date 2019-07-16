//
//  PhoneEntryViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit
import libPhoneNumber_iOS

private let placeholderColor = UIColor(red: 0.78, green: 0.78, blue: 0.81, alpha: 1.0)

class PhoneEntryViewController: AuthorizationBaseViewController<PhoneEntryView> {

    private let countryManager: CountryManager
    private let authorizerSession: TDAuthorizerSession
    private var shouldSetPreferredCountry = true
    
    private var currentCountry: CountryInfo? {
        didSet {
            if let country = currentCountry {
                let title = "\(country.emojiFlag) \(country.displayedName)"
                
                contentView.countryButton.setTitle(title, for: [])
                contentView.countryButton.titleLabel?.textColor = .black
            } else {
                contentView.countryButton.setTitle(L.Login.SelectCountry.Title, for: [])
                contentView.countryButton.titleLabel?.textColor = placeholderColor
            }
        }
    }
    
    init(countryManager: CountryManager, authorizerSession: TDAuthorizerSession) {
        self.countryManager = countryManager
        self.authorizerSession = authorizerSession
        
        super.init(contentView: .instantiateFromNib(), isFinalStep: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Telegram"
        
        setupViews()
        
        processPhoneNumber(countryManager.defaultCountry.phoneCode)
        shouldSetPreferredCountry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contentView.numberTextField.becomeFirstResponder()
    }
    
    private func setupViews() {
        contentView.countryButton.addTarget(self, action: #selector(countryButtonTapped), for: .touchUpInside)
        
        contentView.countryCodeTextField.delegate = self
        contentView.numberTextField.delegate = self
    }
    
    // MARK: - Phone number
    
    private func processPhoneNumber(_ phoneNumber: String) {
        shouldSetPreferredCountry = false
        
        let phoneNumber = String(phoneNumber.filter("0123456789".contains))
        
        guard let country = countryManager.infoForPhoneNumber(phoneNumber) else {
            currentCountry = nil
            
            contentView.countryCodeTextField.text = "+" + String(phoneNumber.prefix(3))
            
            if phoneNumber.count > 3 {
                let startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
                
                contentView.numberTextField.text = phoneNumber.substring(from: startIndex)
            } else {
                contentView.numberTextField.text = ""
            }
            
            return
        }
        
        currentCountry = country
        
        var formattedPhoneNumber = NBAsYouTypeFormatter(regionCode: country.countryCode)!.inputString(phoneNumber)!
        
        let range = formattedPhoneNumber.range(of: country.phoneCode) ??
            formattedPhoneNumber.startIndex..<formattedPhoneNumber.index(formattedPhoneNumber.startIndex, offsetBy: 3)
        
        formattedPhoneNumber.removeSubrange(range)
        
        contentView.countryCodeTextField.text = "+" + country.phoneCode
        
        contentView.numberTextField.text = formattedPhoneNumber.trimmingCharacters(in: .whitespaces)
    }
    
    // MARK: - Actions
    
    @objc private func countryButtonTapped() {
        let controller = CountrySelectionViewController(countryManager: countryManager) { country in
            
        }
        
        present(controller, animated: true, completion: nil)
    }
    
}

// MARK: - UITextFieldDelegate

extension PhoneEntryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text: String
        
        if string.count > 1 {
            text = string
        } else {
            text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            
            if textField == contentView.countryCodeTextField {
                text += contentView.numberTextField.text ?? ""
            } else {
                text = (contentView.countryCodeTextField.text ?? "") + text
            }
        }
        
        processPhoneNumber(text)
        
        return false
    }
}
