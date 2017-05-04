//
//  ViewController.swift
//  Calcit
//
//  Created by Student on 2017-01-11.
//  Copyright © 2017 proapptive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // Buttosns Outlet References
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
   
    
   // Variable Declaratiobns
    var isFirstDigit = true
    var operand1: Double = 0
    var operation = "="
    
    
    
    // Returns Double value
    var displayValue: Double {
        get {
            
            return NumberFormatter().number(from: displayLabel.text!)!.doubleValue
        }
        set {

            displayLabel.text = "\(newValue)"
            isFirstDigit = true
            operation = "="
            
        }
    }
    
    
    // All the digits are conncted to below action
    @IBAction func touchDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        displayLabel.text = isFirstDigit ? digit : displayLabel.text! + digit
        isFirstDigit = false
        if (digit == "."){
            self.decimal.isEnabled = false
        }
        
        
    }
    
    
    // To Clear the display screen
    @IBAction func clearDisplay(sender: AnyObject) {
        displayValue = 0
        self.decimal.isEnabled = true
    }
    
    
    // After clicking any operation button
    @IBAction func saveOperand(sender: UIButton) {
        
        if (displayLabel.text == "Not a number")
        {
           displayLabel.text = "Not a number"
        }
        else
        {
            operation = sender.currentTitle!
            operand1 = displayValue
            isFirstDigit = true
            self.decimal.isEnabled = true
        }
        
    }
    
    // To negate the value of displayed string
    @IBAction func negate(_ sender: UIButton) {
        if (displayLabel.text == "Not a number")
        {
            displayLabel.text = "Not a number"
        }
        else
        {
            displayValue = 0 - displayValue
        }
    }
    
    // Get percent value
    @IBAction func perc(_ sender: UIButton) {
        if (displayLabel.text == "Not a number")
        {
            displayLabel.text = "Not a number"
        }
        else
        {
            displayValue /= 100
        }
    }
    
    // Calculate operation executes after clicking the = button
    @IBAction func calculate(_ sender: UIButton) {
        
        if (displayLabel.text == "Not a number")
        {
            displayLabel.text = "Not a number"
        }
        else
        {
        switch operation {
            
        case "/":
            
            if ((displayValue == 0) || (displayValue == 00))
            {
                displayLabel.text = "Not a number"
                self.decimal.isEnabled = true
                isFirstDigit = true
                
            }
            else
            {
                displayValue = operand1 / displayValue;
                self.decimal.isEnabled = true
            }
            
        case "*":displayValue *= operand1;self.decimal.isEnabled = true
        case "+":displayValue += operand1;self.decimal.isEnabled = true
        case "-":displayValue = operand1 - displayValue;self.decimal.isEnabled = true
        case "power":displayValue = pow(operand1,displayValue);self.decimal.isEnabled = true
        default:break
        }
        
       
       
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

