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
        
    
        customView.lblFirstName.text = "This is the customView"
        //AuthenticationPresenter.instance.login()
        
        
        let btn = UIButton(frame: .init(origin: .zero, size: .init(width: 100, height: 50)))
        btn.setTitle("Push", for: .normal)
        btn.addTarget(self, action: #selector(showCountryPicker), for: .touchUpInside)
        btn.setTitleColor(.black, for: .normal)
        view.addSubview(btn)
        btn.center = view.center
    }
    
    
    @objc func showCountryPicker(){
//        let picker = CountryPicker(style: .grouped)
//        picker.delegate = self
//        picker.showCallingCodes = true
//        picker.defaultCountryCode = "IN"
//        let pickerNavigationController = UINavigationController(rootViewController: picker)
//        self.present(pickerNavigationController, animated: true, completion: nil)
        showToast(message: "Please enter the text Please enter the text Please enter the text Please enter the text") {
            let vc:ViewPagerVC = self.viewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
    }


}
extension ViewController:CountryPickerDelegate{
    func countryPicker(_ picker: CountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String, flagImg: UIImage) {
        print(name,code,dialCode)
    }

}

