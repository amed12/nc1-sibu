//
//  StringFormat.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import Foundation

func doubleToRupiah(_ price: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return "Rp \(numberFormatter.string(from: price as NSNumber)!),00"
    } 
