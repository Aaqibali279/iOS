//
//  UIView.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
extension UIView{
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowColor:UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
}

//MARK:- GRADIENT
extension UIView{
    func gradient(colors:Array<CGColor>,start:CGPoint,end:CGPoint){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = bounds
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        layer.insertSublayer(gradientLayer, at: 0)
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
    }
}

//MARK:- IMAGE
extension UIView{
    func image(iv:UIImageView,cache:NSCache<NSString,UIImage>?,urlString:String?){
        iv.image = nil
        DispatchQueue.global(qos: .userInteractive).async {
            
            guard let urlString = urlString else{
                self.setImage(iv:iv,image: nil)
                return
            }
            
            if let img = cache?.object(forKey: NSString(string:urlString)) {
                self.setImage(iv:iv,image: img)
                return
            }
            
            guard let url = URL.init(string:  urlString) else{
                self.setImage(iv:iv,image: nil)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                self.setImage(iv:iv,image: nil)
                return
            }
            
            guard let image = UIImage(data: data) else{
                self.setImage(iv:iv,image: nil)
                return
            }
            cache?.setObject(image, forKey: NSString(string: urlString))
            self.setImage(iv:iv,image: image)
        }
    }
    
    func setImage(iv:UIImageView,image:UIImage?) {
        DispatchQueue.main.async {
            iv.image = image ?? UIImage(named: "broken_image")
        }
    }
}

