//
//  View.swift
//  DemoProject
//
//  Created by Aquib on 03/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit

class View: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblFirstName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("View", owner: self, options: nil)
        contentView.fixInView(self)
    }
}
extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame
        container.addSubview(self)
        leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}
