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
    
    func showToast(message : String,completion: (()->())? = nil) {
        
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = message
        label.font = .systemFont(ofSize: 16)
        label.alpha = 1.0
        label.layer.cornerRadius = 10
        label.clipsToBounds  =  true
        let height = message.height(font: label.font, width: 250) + 16
        label.frame = CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-200, width: 250, height: height)
        self.view.addSubview(label)
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseOut, animations: {
            label.alpha = 0.0
        }, completion: {(finished) in
            label.removeFromSuperview()
            completion?()
        })
    }
    
}

