//
//  DetailViewController.swift
//  DemoProject
//
//  Created by Aquib on 17/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit
import Hero

class DetailViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var iv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let gesture = UITapGestureRecognizer(target: self, action: #selector(pop))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
        
    }

    @objc func pop(){
        hero.modalAnimationType = .pageOut(direction: .right)
        dismiss(animated: true)
    }
}
