//
//  CollLandingCell.swift
//  LoginScreens
//
//  Created by Ahir on 12/05/24.
//

import UIKit

class CollLandingCell: UICollectionViewCell {
    
    @IBOutlet private weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with strImg: String) {
        img.image = UIImage(named: strImg)
    }
}
