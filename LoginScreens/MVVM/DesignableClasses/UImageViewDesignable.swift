//
//  UImageViewDesignable.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import Foundation
import UIKit

@IBDesignable
class UIImageViewDesignable: UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
}
