//
//  CodeEntryViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/17/19.
//

import UIKit

class CodeEntryViewController: AuthorizationBaseViewController<CodeEntryView> {
    private let codeInfo: TDObject.AuthenticationCodeInfo
    private var currentTimeout: Int
    private let codeLength: Int?
    private var timer: Timer?
    
    init(codeInfo: TDObject.AuthenticationCodeInfo) {
        self.codeInfo = codeInfo
        currentTimeout = codeInfo.timeout
        
        switch codeInfo.type {
        case .telegramMessage(let length):
            codeLength = length
        case .sms(let length):
            codeLength = length
        case .call(let length):
            codeLength = length
        case .flashCall:
            codeLength = nil
        }
        
        super.init(contentView: .instantiateFromNib(), isFinalStep: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCodeInfo()
        processCode("")
        
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        contentView.codeTextField.delegate = self
        
        contentView.resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
    }
    
    private func setupCodeInfo() {
        setupTitle()
        setupSubtitle()
        
        setupTimer()
        setupNextType()
    }
    
    private func setupTitle() {
        let font: UIFont
        let text: String
        
        if codeInfo.type.isTelegramMessage {
            font = .systemFont(ofSize: Constants.screenSize.width > 321 ? 22 : 18,
                               weight: .semibold)
            
            text = L.Login.CheckOtherSessionMessages
            
            title = codeInfo.phoneNumber
        } else {
            font = .systemFont(ofSize: 30, weight: .light)
            
            text = codeInfo.phoneNumber
            
            contentView.imageView?.removeFromSuperview()
            
            contentView.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        }
        
        contentView.titleLabel.attributedText = NSAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: UIColor.black
            ])
    }
    
    private func setupSubtitle() {
        switch codeInfo.type {
        case .sms:
            contentView.subtitleLabel.text = L.Login.CodeSentSms
            
        case .telegramMessage:
            contentView.subtitleLabel.text = L.Login.CodeSentInternal
            
        case .call, .flashCall:
            contentView.subtitleLabel.text = L.ChangePhoneNumberCode.Called
        }
    }
    
    private func setupTimer() {
        guard currentTimeout > 0 else { return }
        
        let target = WeakTimerTarget(target: self, selector: #selector(timerFired))
        timer = Timer.scheduledTimer(timeInterval: 1, target: target, selector: #selector(WeakTimerTarget.timerFired(_:)), userInfo: nil, repeats: true)
    }
    
    private func setupNextType() {
        guard let nextType = codeInfo.nextType, currentTimeout > 0 else {
            if codeInfo.type.isTelegramMessage {
                contentView.resendButton.setTitle(L.Login.SendCodeViaSms, for: [])
            } else {
                contentView.resendButton.isHidden = true
            }
            
            return
        }
        
        let minutes = currentTimeout / 60
        let seconds = currentTimeout % 60
        let timeString = String(format: "%d:%.2d", minutes, seconds)
        
        UIView.performWithoutAnimation {
            contentView.resendButton.setTitleColor(.black, for: [])
            contentView.resendButtonContainerView.isUserInteractionEnabled = false
            
            switch nextType {
            case .sms:
                contentView.resendButton.setTitle(L.Login.WillSendSms(timeString), for: [])
                
            case .call, .flashCall:
                contentView.resendButton.setTitle(L.ChangePhoneNumberCode.CallTimer(timeString), for: [])
                
            default:
                break
            }
            
            contentView.resendButton.layoutIfNeeded()
        }
    }
    
    // MARK: - Process code
    
    private func processCode(_ code: String) {
        nextButtonItem.isEnabled = !code.isEmpty
        
        if code.count == codeLength {
            confirmCode(code)
        }
    }
    
    // MARK: - Actions
    
    private func confirmCode(_ code: String? = nil) {
        let code = code ?? contentView.codeTextField.text ?? ""
        
        if let codeLength = codeLength, code.count != codeLength {
            contentView.codeTextField.layer.addShakeAnimation()
            return
        }
        
        guard let authorizer = authorizer else { return }
        
        isProcessing = true
        
        authorizer.setAuthenticationCode(code) { [weak self] error in
            guard let error = error, let self = self else { return }
            
            self.isProcessing = false
            
            self.authorizationViewController?.showErrorAlert(with: error.localizedMessage)
        }
    }
    
    private func resendCode() {
        guard let authorizer = authorizer else { return }
        
        isProcessing = true
        
        authorizer.resendAuthenticationCode { [weak self] error in
            guard let error = error, let self = self else { return }
            
            self.isProcessing = false
            
            self.authorizationViewController?.showErrorAlert(with: error.localizedMessage)
        }
    }
    
    override func nextButtonTapped() {
        confirmCode()
    }
    
    @objc private func resendButtonTapped() {
        resendCode()
    }
    
    @objc private func timerFired() {
        guard currentTimeout > 0 else {
            timer?.invalidate()
            timer = nil
            return
        }
        
        currentTimeout -= 1
        setupNextType()
        
        if currentTimeout == 1 {
            resendCode()
        }
    }

}

// MARK: - UITextFieldDelegate

extension CodeEntryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isProcessing {
            return false
        }
        
        let initialText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        let filtredText = initialText.removingNonDigits
        
        processCode(filtredText)
        
        if initialText == filtredText {
            return true
        }
        
        textField.text = filtredText
        
        return false
    }
}
