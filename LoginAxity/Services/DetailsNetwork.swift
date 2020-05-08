//
//  DetailsNetwork.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine


class DetailsNetwork: ObservableObject{
    
  @Published var userDetails = [UserDetails]()
    
    init () {
        DispatchQueue.main.async {
            Alamofire.request("https://reqres.in/api/users/").responseJSON{(response)in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    for item in json["data"]{
                        let id = item.1["id"].int ?? 0
                        let first_name = item.1["first_name"].string ?? ""
                        let email = item.1["email"].string ?? ""
                        let avatar = item.1["avatar"].string ?? ""
                        let user = UserDetails(id: id, first_name: first_name, email: email, avatar: avatar)
                        self.userDetails.append(user)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
