//
//  UITextField.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
@IBDesignable
extension UITextField {
    
    @IBInspectable var rightAccessory: UIImage? {
        set {
            if newValue != nil {
                let iv = UIImageView(frame: CGRect(x: 16, y: 8, width: 24, height: 24))
                iv.image = newValue
                iv.contentMode = .scaleAspectFit
                let viewRight: UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 56, height: 40))// set per your requirement
                viewRight.addSubview(iv)
                rightViewMode = .always
                rightView = viewRight
            } else {
                rightViewMode = .never
                rightView = nil
            }
        }
        get {
            if let imageView = self.rightView as? UIImageView {
                return imageView.image
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var leftAccessary: UIImage? {
        set {
            if newValue != nil {
                let iv = UIImageView(frame: CGRect(x: 16, y: 8, width: 24, height: 24))
                iv.image = newValue
                iv.contentMode = .scaleAspectFit
                let viewLeft: UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 56, height: 40))// set per your requirement
                viewLeft.addSubview(iv)
                self.leftView = viewLeft
                self.leftViewMode = .always
            } else {
                leftViewMode = .never
                leftView = nil
            }
        }
        get {
            if let imageView = self.leftView as? UIImageView {
                return imageView.image
            } else {
                return nil
            }
        }
    }
    
    //MARK:- Password accessoryView
    @IBInspectable var secureEntry: UIImage? {
        set{
            if secureEntry != nil {
                let btn = UIButton(frame: CGRect(x: 16, y: 8, width: 24, height: 24))
                let viewRight: UIView = UIView(frame: CGRect.init(x: 0, y: 0, width: 56, height: 40))// set per your requirement
                viewRight.addSubview(btn)
                
                btn.setImage(#imageLiteral(resourceName: "user"), for: .normal)
                btn.setImage(#imageLiteral(resourceName: "bell"), for: .selected)
                btn.addTarget(self, action: #selector(accessoryHandler), for: .touchUpInside)
                rightViewMode = .always
                isSecureTextEntry = true
                rightView = viewRight
            } else {
                rightViewMode = .never
                rightView = nil
            }
        }
        get{
            return UIImage()
        }
        
    }

    
    @objc private func accessoryHandler(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
}
