//
//  ProductViewController.swift
//  LoginScreens
//
//  Created by Ahir on 29/02/24.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    var productData: ProductModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.delegate = self
        tblview.dataSource = self
        loadJson()
    }

    private func loadJson() {
        if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                DispatchQueue.main.async {
                    self.tblview.reloadData()
                }
            } catch let error {
                print("Errors occured", error)
            }
        }
    }
    
    private func redirectToAllProductCtrl(category: Categories) {
        if let ctrl = storyboard?.instantiateViewController(withIdentifier: "ProductListingViewController") as? ProductListingViewController {
            ctrl.category = category
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
    
    private func redirectToProductDetail(product: Products) {
        if let ctrl = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            ctrl.product = product
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productData?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        cell.category =  productData?.response[indexPath.row]
        cell.btnAllClicked = {
            if let productData = self.productData {
                self.redirectToAllProductCtrl(category: productData.response[indexPath.row])
            }
        }
        cell.productClicked = { product in
            self.redirectToProductDetail(product: product)
        }
        return cell
    }
    
    
}
