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
    var observation: TDObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Swiftygram"
        
        let parameters = TDObject.TdlibParameters(useTestDc: true,
                                                  databaseDirectory: path,
                                                  filesDirectory: path,
                                                  useFileDatabase: true,
                                                  useChatInfoDatabase: true,
                                                  useMessageDatabase: true,
                                                  useSecretChats: false,
                                                  apiId: 110110,
                                                  apiHash: "2e4f47c07d66d4461943d47f4f18a555",
                                                  systemLanguageCode: "ru",
                                                  deviceModel: "iPhone",
                                                  systemVersion: "11.1",
                                                  applicationVersion: "1.0",
                                                  enableStorageOptimizer: false,
                                                  ignoreFileNames: true)
        
        observation = client.observeUpdates(for: TDObject.UpdateAuthorizationState.self) { update in
            switch update.authorizationState {
            case .waitTdlibParameters:
                let query = TDFunction.SetTdlibParameters(parameters: parameters)
                
                self.client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitEncryptionKey:
                let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: "kekLol21312323123132")
                
                self.client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitPhoneNumber:
                let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: "380957965942", allowFlashCall: false, isCurrentPhoneNumber: true)
                
                self.client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitCode:
                let code = "82975"
                
                print()
                print(code)
                print()
                let query = TDFunction.CheckAuthenticationCode(code: code, firstName: "", lastName: "")
                
                self.client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            default:
                print(update.authorizationState)
                print()
            }
        }
        
//        let f = TGFunction.SetTdlibParameters(parameters: TGObject.TdlibParameters())
//        
//        client.execute(f) { result in
//            switch result {
//            case .success(_, _):
//                break
//                
//            case .failure(let error):
//                print(error)
//            }
//        }
    }


}

