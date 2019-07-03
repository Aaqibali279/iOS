//
//  ADCountry.swift
//  ADCountryPicker
//
//  Created by Amila on 21/04/2017.
//  Copyright © 2017 Amila Diman. All rights reserved.
//

import UIKit

class Country: NSObject {
    @objc var name: String
    @objc var code: String
    var section: Int?
   @objc  var dialCode: String!
   @objc  var flagImg: UIImage?
    
    init(name: String, code: String, dialCode: String = " - ", flagImg: UIImage?) {
        self.name = name
        self.code = code
        self.dialCode = dialCode
        self.flagImg = flagImg
    }
}
