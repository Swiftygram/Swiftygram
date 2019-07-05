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
    
    let client1 = TDClient()
    let client2 = TDClient()
    var observation1: TDCancellable?
    var observation2: TDCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        observation1 = kek(client1)
        observation2 = kek(client2)
    }

    func kek(_ client: TDClient) -> TDCancellable {
        let f = TDFunction.SetLogStream(logStream: .empty)
        
        client.execute(f)
        
        let isSecondClient = client === client2
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Swiftygram\(isSecondClient ? "" : "")"
        
        let parameters = TDObject.TdlibParameters(useTestDc: false,
                                                  databaseDirectory: path,
                                                  filesDirectory: path + (isSecondClient ? "2" : ""),
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
        
        return client.observeUpdates(for: TDObject.UpdateAuthorizationState.self) { update in
            switch update.authorizationState {
            case .waitTdlibParameters:
                let query = TDFunction.SetTdlibParameters(parameters: parameters)
                
                client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitEncryptionKey:
                let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: "kekLol21312323123136")
                
                client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitPhoneNumber:
                let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: "380957965942", allowFlashCall: false, isCurrentPhoneNumber: true)
                
                client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .waitCode:
                let code = "96917"
                
                print()
                print(code)
                print()
                let query = TDFunction.CheckAuthenticationCode(code: code, firstName: "", lastName: "")
                
                client.execute(query, completionHandler: { result in
                    print(result)
                    print()
                })
                
            case .ready:
                let query = TDFunction.GetMe()
                
                client.execute(query, completionHandler: { result in
//                    assert(!isSecondClient)
                    print(result)
                    print()
                })
                
            default:
                print(update.authorizationState)
                print()
            }
        }
    }

}

