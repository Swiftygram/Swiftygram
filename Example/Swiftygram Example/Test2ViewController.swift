//
//  Test2ViewController.swift
//  Swiftygram Example
//
//  Created by KY1VSTAR on 7/13/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {

    let theScrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .red
        return v
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 1.0, alpha: 1.0)
        return v
    }()
    
    let stackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.alignment = .fill
        v.distribution = .fill
        v.spacing = 20
        return v
    }()
    
    let topLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.boldSystemFont(ofSize: 32.0)
        v.backgroundColor = .yellow
        return v
    }()
    
    let centerLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 17.0)
        v.numberOfLines = 0
        v.backgroundColor = .green
        return v
    }()
    
    let bottomLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 14.0)
        v.numberOfLines = 0
        v.backgroundColor = .cyan
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theScrollView.contentInset.bottom = 200
        
        [theScrollView, contentView, stackView, topLabel, centerLabel, bottomLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(theScrollView)
        theScrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(bottomLabel)
        
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: theScrollView.heightAnchor, constant: 0.0)
        contentViewHeightConstraint.priority = .defaultLow
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                
                // constrain all 4 sides of the scroll view to the safe area
                theScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
                theScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
                theScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0),
                theScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0),
                
                // constrain all 4 sides of the content view to the scroll view
                contentView.topAnchor.constraint(equalTo: theScrollView.topAnchor, constant: 0.0),
                contentView.bottomAnchor.constraint(equalTo: theScrollView.bottomAnchor, constant: 0.0),
                contentView.leadingAnchor.constraint(equalTo: theScrollView.leadingAnchor, constant: 0.0),
                contentView.trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: 0.0),
                
                // constrain width of content view to width of scroll view
                contentView.widthAnchor.constraint(equalTo: theScrollView.widthAnchor, constant: 0.0),
                
                // constrain the stack view >= 8-pts from the top
                // <= minus 8-pts from the bottom
                // 40-pts leading and trailing
                stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8.0),
                stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8.0),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40.0),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40.0),
                
                // constrain stack view centerY to contentView centerY
                stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0.0),
                
                // activate the contentView's height constraint
                contentViewHeightConstraint,
                
                ])
        } else {
            // Fallback on earlier versions
        }
        
        topLabel.text = "Anger"
        bottomLabel.text = "Based on information from Wikipedia APA Dictionary of Psychology"
        
        // a sample paragraph of text
        let centerSampleText = "Anger is an intense emotion defined as a response to a perceived provocation, the invasion of one’s boundaries, or a threat. From an evolutionary standpoint, anger servers to mobilise psychological resources in order to address the threat/invasion. Anger is directed at an individual of equal status."
        
        // change to repeat the center-label sample text
        let numberOfParagraphs = 2
        
        var s = ""
        
        for i in 1...numberOfParagraphs {
            s += "\(i). " + centerSampleText
            if i < numberOfParagraphs {
                s += "\n\n"
            }
        }
        
        centerLabel.text = s
        
    }

}
