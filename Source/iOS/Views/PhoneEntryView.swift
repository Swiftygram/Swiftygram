//
//  PhoneEntryView.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit

private let separatorColor = UIColor(red: 0.78, green: 0.78, blue: 0.80, alpha: 1.0)
private let highlightedBackgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)

class PhoneEntryView: UIView, NibBasedView, AuthorizationContentView {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = L.Login.PhoneTitle
        }
    }
    
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            subtitleLabel.text = L.Login.PhoneAndCountryHelp
        }
    }
    
    @IBOutlet var countryButton: UIButton! {
        didSet {
            countryButton.setBackgroundImage(countryButtonBackgroundImage(), for: [])
            countryButton.setBackgroundImage(countryButtonHighlightedBackgroundImage(), for: .highlighted)
        }
    }
    
    @IBOutlet var phoneBackgroundImageView: UIImageView! {
        didSet {
            phoneBackgroundImageView.image = phoneBackgroundImage()
        }
    }
    
    @IBOutlet var countryCodeTextField: UITextField!
    
    @IBOutlet var numberTextField: UITextField! {
        didSet {
            numberTextField.placeholder = L.Login.PhonePlaceholder
        }
    }
    
    var isProcessing = false {
        didSet {
            
        }
    }
    
    private func countryButtonBackgroundImage() -> UIImage {
        let size = CGSize(width: 61, height: 67)
        let arrowSize: CGFloat = 10
        let lineWidth = 1 / UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setStrokeColor(separatorColor.cgColor)
        context.setLineWidth(lineWidth)
        context.move(to: CGPoint(x: 15.0, y: lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width, y: lineWidth / 2.0))
        context.strokePath()
        
        context.move(to: CGPoint(x: size.width, y: size.height - arrowSize - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width - 1.0, y: size.height - arrowSize - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width - 1.0 - arrowSize, y: size.height - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width - 1.0 - arrowSize - arrowSize, y: size.height - arrowSize - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: 15.0, y: size.height - arrowSize - lineWidth / 2.0))
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: 1, left: size.width - 1, bottom: size.height - 2, right: 1))
    }
    
    private func countryButtonHighlightedBackgroundImage() -> UIImage {
        let size = CGSize(width: 60, height: 67)
        let arrowSize: CGFloat = 10
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(highlightedBackgroundColor.cgColor)
        context.fill(CGRect(origin: CGPoint(), size: CGSize(width: size.width, height: size.height - arrowSize)))
        context.move(to: CGPoint(x: size.width, y: size.height - arrowSize))
        context.addLine(to: CGPoint(x: size.width - 1.0, y: size.height - arrowSize))
        context.addLine(to: CGPoint(x: size.width - 1.0 - arrowSize, y: size.height))
        context.addLine(to: CGPoint(x: size.width - 1.0 - arrowSize - arrowSize, y: size.height - arrowSize))
        context.closePath()
        context.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image.stretchableImage(withLeftCapWidth: 61, topCapHeight: 2)
    }
    
    private func phoneBackgroundImage() -> UIImage {
        let size = CGSize(width: 85, height: 57)
        let lineWidth = 1 / UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        
//        context.clear(CGRect(origin: CGPoint(), size: size))
        context.setStrokeColor(separatorColor.cgColor)
        context.setLineWidth(lineWidth)
        context.move(to: CGPoint(x: 15.0, y: size.height - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width, y: size.height - lineWidth / 2.0))
        context.strokePath()
        context.move(to: CGPoint(x: size.width - 2.0 + lineWidth / 2.0, y: size.height - lineWidth / 2.0))
        context.addLine(to: CGPoint(x: size.width - 2.0 + lineWidth / 2.0, y: 0.0))
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image.stretchableImage(withLeftCapWidth: 84, topCapHeight: 2)
    }

}
