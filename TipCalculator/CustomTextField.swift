//
//  CustomTextField.swift
//  TipCalculator
//
//  Created by Andrew Foster on 2/8/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    @IBInspectable var textReturned: String = "" {
        didSet {
            return self.text = "$\(textReturned)"
        }
        
        
    }

}
