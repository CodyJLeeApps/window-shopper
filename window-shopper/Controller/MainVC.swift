//
//  ViewController.swift
//  window-shopper
//
//  Created by Cody Lee on 10/5/17.
//  Copyright © 2017 CJLeeApps. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    
    @IBOutlet weak var clearCalcBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a button that follows keyboard.
        let calcBtn = UIButton(frame: CGRect(x: 0,
                                             y: 0,
                                             width: view.frame.size.width,
                                             height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        // Set button Text
        calcBtn.setTitle("Calculate",
                         for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                              for: .normal)
        // #selector req
        calcBtn.addTarget(self,
                          action: #selector(MainVC.calculate),
                          for: .touchUpInside)
        
        // Add the custom button to the input
        wageTxt.inputAccessoryView = calcBtn
        priceTxt.inputAccessoryView = calcBtn
        
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        clearCalcBtn.isHidden = true
    }

    @objc func calculate() {
        
        
        if let wageTxt  = wageTxt.text, let priceText = priceTxt.text {
            if let wage = Double(wageTxt), let price = Double(priceText) {
                view.endEditing(true)
                resultLbl.isHidden  = false
                hoursLbl.isHidden   = false
                resultLbl.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
                clearCalcBtn.isHidden = false
            }
        }
        
    }

    @IBAction func clearCalcTapped(_ sender: Any) {
        resultLbl.isHidden  = true
        hoursLbl.isHidden   = true
        clearCalcBtn.isHidden = true
        
        wageTxt.text    = ""
        priceTxt.text   = ""
    }
    
}

