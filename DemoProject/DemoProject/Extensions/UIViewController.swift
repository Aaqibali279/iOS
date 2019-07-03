//
//  UIViewController.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

enum AlertButtonTitle {
    case ok, cancel, yes, no
    var value: String {
        switch self {
        case .ok: return "OK"
        case .cancel: return "CANCEL"
        case .yes: return "YES"
        case .no: return "NO"
        }
    }
}



enum AlertTitle {
    case appName
    case interNet
    case location
    var value: String {
        switch self {
        case .appName: return "Demo App"
        case .interNet: return "No Internet Connection"
        case .location: return "Location Services"
        }
    }
}

enum Message {
    case custom(String)
    case message
    case network
    
    var value: String {
        switch self {
        case .custom(let message) : return message
        case .message : return "Something went wrong"
        case .network : return "Network not available"
        }
    }
}

typealias ActionHandler = (_ index:Int)->()

import UIKit
extension UIViewController {
    func viewController<T:UIViewController>() -> T {
        return UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    
    func alert(title: AlertTitle = .appName, message: Message, options: AlertButtonTitle..., completion: ActionHandler? = nil) {
        let alertController = UIAlertController(title: title.value, message: message.value, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option.value, style: (options.count > 1 ? (option != .cancel ? UIAlertAction.Style.default : UIAlertAction.Style.default) : UIAlertAction.Style.default), handler: { (action) in
                completion?(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
}

