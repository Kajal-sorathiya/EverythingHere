//
//  CustomCollectionViewCell.swift
//  LoginScreens
//
//  Created by Ahir on 13/03/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    
    override func prepareForReuse() {
        imgview.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Cell UI
    private func setupCell() {
        imgview.layer.backgroundColor = UIColor.blue.cgColor
        imgview.layer.cornerRadius = 20
        imgview.layer.borderWidth = 1
        imgview.layer.borderColor = UIColor.white.cgColor
    }
    
    // MARK: Configure cell
    func configureImgsCell(_ img: String) {
        imgview.image = UIImage(named: img)
    }
}
