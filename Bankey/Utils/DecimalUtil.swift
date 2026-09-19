//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Diego Marcolino Santana on 15/09/26.
//

import Foundation


extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
