//
//  ViewController.swift
//  DemoProject
//
//  Created by Aquib on 26/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: View!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Indicator.instance.show()
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showCountryPicker))
        view.addGestureRecognizer(gesture)
        customView.lblFirstName.text = "This is the customView"
        AuthenticationPresenter.instance.login()
        
    }
    
    
    @objc func showCountryPicker(){
        let picker = CountryPicker(style: .grouped)
        picker.delegate = self
        picker.showCallingCodes = true
        picker.defaultCountryCode = "IN"
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }


}
extension ViewController:CountryPickerDelegate{
    func countryPicker(_ picker: CountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String, flagImg: UIImage) {
        print(name,code,dialCode)
    }

}

