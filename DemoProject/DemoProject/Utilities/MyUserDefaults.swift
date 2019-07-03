//
//  MyUserDefaults.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import Foundation
struct MyUserDefaults {
    
    static let instance = MyUserDefaults()
    private init(){}
    
    private let username = "username"
    
    let defaults = UserDefaults.standard
    
    func set(username:String) {
        defaults.setValue(username, forKey:username)
        defaults.synchronize()
    }
    
    func getUsername() -> String? {
        return defaults.value(forKey: username) as? String
    }
    
}
