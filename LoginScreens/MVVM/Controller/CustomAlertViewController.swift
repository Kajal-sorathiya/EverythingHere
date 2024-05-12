//
//  CustomAlertViewController.swift
//  LoginScreens
//
//  Created by Ahir on 25/04/24.
//

import UIKit

class CustomAlertViewController: UIViewController {

    let presentCtrl = UIViewController()
//    let delegate = 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func startAnimation() {
        let ctrl = storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as? CustomAlertViewController
        if let ctrl {
            ctrl.modalPresentationStyle = .custom
            presentCtrl.present(ctrl, animated: true)
        }
    }
}
