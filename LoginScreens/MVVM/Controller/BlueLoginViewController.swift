//
//  BlueLoginViewController.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import UIKit

class BlueLoginViewController: UIViewController {

    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var userView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shapeUpViews()
    }
    
    private func shapeUpViews() {
        userView.layer.cornerRadius = 40
        userView.layer.shadowColor = UIColor.lightGray.cgColor
        userView.layer.shadowOffset = CGSizeMake(0, 5)
        userView.layer.shadowOpacity = 1
        userView.layer.shadowPath = UIBezierPath(roundedRect: userView.bounds, cornerRadius: 30).cgPath
        userView.layer.cornerRadius = 30
        userImgView.clipsToBounds = true
//        userImgView.layer.cornerRadius = 25
    }
}
