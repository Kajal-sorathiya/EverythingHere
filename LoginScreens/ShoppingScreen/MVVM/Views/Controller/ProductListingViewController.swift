//
//  ProductListingViewController.swift
//  LoginScreens
//
//  Created by Ahir on 05/03/24.
//

import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    var category: Categories?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.delegate = self
        tblview.dataSource = self
        navigationItem.title = category?.categoryName
    }
    private func redirectToProductDetailScreen(product: Products) {
        if let ctrl = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            ctrl.product = product
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
}

extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblview.dequeueReusableCell(withIdentifier: "AllProductCell", for: indexPath) as? AllProductCell else {
            return UITableViewCell()
        }
        cell.configure(product: category?.products[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let category = category {
            redirectToProductDetailScreen(product: category.products[indexPath.row])
        }
    }
}
