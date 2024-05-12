//
//  CollFlowLayoutCell.swift
//  LoginScreens
//
//  Created by Ahir on 07/05/24.
//

import UIKit

class CollFlowLayoutCell: UICollectionViewCell {
    
    @IBOutlet private weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func config(strTitle: String) {
        lblTitle.text = strTitle
    }
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        setNeedsLayout()
//        layoutIfNeeded()
//            
//        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//            
//        var frame = layoutAttributes.frame
//        frame.size.height = ceil(size.height)
//            
//        layoutAttributes.frame = frame
//            
//        return layoutAttributes
//    }
}
