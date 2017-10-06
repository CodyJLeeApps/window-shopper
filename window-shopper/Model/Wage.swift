//
//  Wage.swift
//  window-shopper
//
//  Created by Cody Lee on 10/6/17.
//  Copyright © 2017 CJLeeApps. All rights reserved.
//

import Foundation

class Wage {
    
    /*
     *
     */
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        let dbl_workHours: Double = ( price / wage )
        let int_workHours: Int = Int( ceil(dbl_workHours) )
        return int_workHours
    }
    
}
