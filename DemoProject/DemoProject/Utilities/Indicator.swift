//
//  Indicator.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//
import UIKit
import NVActivityIndicatorView
class Indicator: UIViewController , NVActivityIndicatorViewable {
    static let instance = Indicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func show() {
        let size = CGSize(width: 40, height: 40)
        startAnimating(size, message: "loading...", type: NVActivityIndicatorType.ballClipRotateMultiple, fadeInAnimation: NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("please wait...")
        }
    }
    
    func hide() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.stopAnimating(nil)
        }
    }
    
}
