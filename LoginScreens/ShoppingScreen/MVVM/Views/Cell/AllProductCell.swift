//
//  AllProductCell.swift
//  LoginScreens
//
//  Created by Ahir on 04/03/24.
//

import UIKit

class AllProductCell: UITableViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        productImg.image = nil
        lblProductName.text = ""
        lblDescription.text = ""
        lblPrice.text = ""
    }
    
    func configure(product: Products?) {
        guard let product = product else { return }
        productImg.image = UIImage(named: product.imageName)
        lblProductName.text = product.name
        lblPrice.text = product.price
        lblDescription.text = product.description
    }
    
    func configureProduct(product: Products?) {
        guard let product = product else { return }
        productImg.image = UIImage(named: product.imageName)
        lblProductName.text = product.name
        lblPrice.text = product.price
        lblDescription.text = product.description
    }
}
