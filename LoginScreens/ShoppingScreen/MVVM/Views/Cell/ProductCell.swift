//
//  ProductCell.swift
//  LoginScreens
//
//  Created by Ahir on 29/02/24.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var lblCategory: UILabel!
    var btnAllClicked: (() -> ())?
    var productClicked: ((Products) -> Void)?
    
    var category: Categories? {
        didSet {
            lblCategory.text = category?.categoryName
            collectionview.reloadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionview.delegate = self
        collectionview.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSeeAllClicked(_ sender: Any) {
        btnAllClicked?()
    }
}

extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lblProductName.text = category?.products[indexPath.row].name
        cell.productImg.image = UIImage(named: category?.products[indexPath.row].imageName ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let products = category?.products {
            productClicked?(products[indexPath.row])
        }
    }
    
}
