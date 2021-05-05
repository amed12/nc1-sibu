//
//  DefaultButton.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import UIKit

@IBDesignable class DefaultButton: UIButton {

    override func layoutSubviews() {
           super.layoutSubviews()

           updateCornerRadius()
       }

       @IBInspectable var rounded: Bool = false {
           didSet {
               updateCornerRadius()
           }
       }

       func updateCornerRadius() {
           layer.cornerRadius = rounded ? frame.size.height / 2 : 0
       }
}
