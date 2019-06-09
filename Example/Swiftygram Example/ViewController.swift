//
//  ViewController.swift
//  Swiftygram Example
//
//  Created by KY1VSTAR on 5/16/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import UIKit
import Swiftygram

class ViewController: UIViewController {
    
    let client = TGClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f = TGFunction.SetTdlibParameters(parameters: TGObject.TdlibParameters())
        
        client.execute(f) { result in
            switch result {
            case .success(_, _):
                break
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

