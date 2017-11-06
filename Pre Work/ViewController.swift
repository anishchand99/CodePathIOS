//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Anish Chand on 11/5/17.
//  Copyright © 2017 Anish Chand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Display: UILabel!
    @IBOutlet weak var billTotalAmount: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!

    @IBOutlet weak var tipPercentageLabel: UILabel!
    var userIsTyping = false
    
    @IBAction func tipSlider(sender: UISlider) {
        tipPercentageLabel.text! = String(format: "%02d%", arguments: [Int(tipSlider.value)])
        calculateTip()
    }
    @IBAction func TouchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let textCurrentlyInDisplay = Display!.text!
            Display!.text = textCurrentlyInDisplay + digit
        } else {
            Display!.text = digit
            userIsTyping = true
        }
        if sender.tag == 11 {
            Display!.text = " "
        }
        
        calculateTip()
    }
    func calculateTip() {
        let amount = (Display.text! as NSString).doubleValue
        let tipPercent = tipSlider.value
        let tipAmount = amount * Double(tipPercent) / 100
        let totalAmount = tipAmount + amount
        billTotalAmount.text = "$\(totalAmount)"
    }
}

