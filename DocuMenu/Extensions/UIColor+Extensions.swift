//
//  UIColor+Extensions.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/23/21.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: Double = 1) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 8) & 0xff) / 255,
            blue: CGFloat(hex & 0xff) / 255,
            alpha: CGFloat(alpha)
        )
    }
}

