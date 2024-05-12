//
//  UIButtonDesignable.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import UIKit
import Foundation

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
}
