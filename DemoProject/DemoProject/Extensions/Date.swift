//
//  Date.swift
//  DemoProject
//
//  Created by Aquib on 27/06/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import Foundation
extension Date{
    func getFormattedDate() -> String{
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz" // This formate is input formated .
        //
        //        let formateDate = dateFormatter.date(from:"2018-02-02 06:50:16 +0000")!
        dateFormatter.dateFormat = "yyyy-MM-dd" // Output Formated
        
        print ("Print :\(dateFormatter.string(from: self))")//Print :"2019-06-30"
        return dateFormatter.string(from: self)
    }
}
