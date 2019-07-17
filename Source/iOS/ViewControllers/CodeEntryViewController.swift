//
//  CodeEntryViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/17/19.
//

import UIKit

class CodeEntryViewController: AuthorizationBaseViewController<CodeEntryView> {
    
    init() {
        super.init(contentView: .instantiateFromNib(), isFinalStep: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
