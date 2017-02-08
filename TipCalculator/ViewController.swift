//
//  ViewController.swift
//  TipCalculator
//
//  Created by Andrew Foster on 2/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billTextField.resignFirstResponder()
        return true
    }

    @IBAction func textFieldCalculation(_ sender: Any) {
        calculateTotal()
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        calculateTotal()
    }
    
    func calculateTotal() {
        if let bill: Double = Double(self.billTextField.text!) {
            
            var tipPercentage: Double = 0.1
            
            if self.tipSegmentedControl.selectedSegmentIndex == 0 {
                tipPercentage = 0.1
            }
            
            if self.tipSegmentedControl.selectedSegmentIndex == 1 {
                tipPercentage = 0.15
            }
            
            if self.tipSegmentedControl.selectedSegmentIndex == 2 {
                tipPercentage = 0.2
            }
            
            let tip = bill * tipPercentage
            let total = tip + bill
            
            // Currency Formatter with localization by Default
            let currencyFarmatter = NumberFormatter()
            currencyFarmatter.numberStyle = .currency
            
            self.tipLabel.text = currencyFarmatter.string(from: NSNumber(value: tip))
            self.totalLabel.text = currencyFarmatter.string(from: NSNumber(value: total))
        }
        
    }


}

