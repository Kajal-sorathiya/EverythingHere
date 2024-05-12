//
//  ProductDetailViewController.swift
//  LoginScreens
//
//  Created by Ahir on 06/03/24.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    var product: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.delegate = self
        tblview.dataSource = self
        navigationItem.title = product?.name
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblview.dequeueReusableCell(withIdentifier: "AllProductCell", for: indexPath) as? AllProductCell else {
            return UITableViewCell()
        }
        cell.configure(product: product)
        return cell
    }
    
    
}
