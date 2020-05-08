//
//  LoginNetwork.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class LoginNet: ObservableObject {
    
    @Published var authenticated = 0
    
    func loginDetail(email: String, pass: String) {
        let parametros: Parameters = [
            "email": email,
            "password": pass
        ]
        
        guard let url = URL(string: "https://reqres.in/api/login") else {
            return
        }
        
        DispatchQueue.main.async {
            Alamofire.request(url, method: .post, parameters: parametros).responseJSON { (response) in print(response)
                
                if let result = response.result.value {

                    let json = result as! NSDictionary
                    if (json.value(forKey: "token") != nil) {
                        self.authenticated = 1
                    }else if (json.value(forKey: "error") != nil){
                        self.authenticated = 2
                    }
                }
            }
        }
    }
}
