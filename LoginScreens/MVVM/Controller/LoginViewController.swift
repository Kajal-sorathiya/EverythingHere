//
//  ViewController.swift
//  LoginScreens
//
//  Created by Ahir on 13/12/23.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginClicked(_ sender: Any) {
        let ctrl = storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as? CustomAlertViewController
        if let ctrl {
            ctrl.modalPresentationStyle = .custom
            ctrl.transitioningDelegate = self
            present(ctrl, animated: true)
        }
        guard let username = txtUsername.text,
                let password = txtPassword.text,
                !username.isEmpty,
                !password.isEmpty else {
            return
        }
        let loginVM = LoginViewModel()
        loginVM.login(username: username, password: password) { employeeData in
            if let employeeData = employeeData {
                print(employeeData.employeeData?.name)
            }
        }
    }
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
        }
}
class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
    }
}
