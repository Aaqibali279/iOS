//
//  AuthenticationPresenter.swift
//  DemoProject
//
//  Created by Aquib on 03/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

struct Status:Decodable {
    let status:Int
    let message:String?
    let token:String?
}


import Foundation
import Alamofire
struct AuthenticationPresenter {
    static let instance = AuthenticationPresenter()
    private init(){}
    
    func login(){
        let params = [
            "email":"aqib.ali@slinfy.com",
            "password":"123456",
            "device_token":"987654651545618",
            "device_type":"1"
        ]
        Network.instance.request(endPoint: Apis.LOGIN, method: .post, parameters:params, success: { (status:Status) in
            print(status.message)
        }) { (message) in
            print(message.value)
        }
    }
}
