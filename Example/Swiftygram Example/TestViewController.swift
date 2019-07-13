//
//  TestViewController.swift
//  Swiftygram Example
//
//  Created by KY1VSTAR on 7/13/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentInset.bottom = 200
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
