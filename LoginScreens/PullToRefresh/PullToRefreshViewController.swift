//
//  PullToRefreshViewController.swift
//  LoginScreens
//
//  Created by Ahir on 02/05/24.
//

import UIKit

class PullToRefreshViewController: UIViewController {
    
    @IBOutlet private weak var tblview: UITableView!
    var stores = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fillUpData()
        setupTableView()
    }
    
    private func fillUpData() {
        let stores = [
            "Adding new store1",
            "Adding new store 2",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3","Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3","Adding new store 3",
            "Adding new store 3","Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3","Adding new store 3",
            "Adding new store 3"
        ]
        let secondStores = [
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3","Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3",
            "Adding new store 3"
        ]
        self.stores = [stores, secondStores].randomElement()!
    }
    
    private func setupTableView() {
        tblview.register(UINib(nibName: StoresCell.identifier, bundle: nil), forCellReuseIdentifier: StoresCell.identifier)
        tblview.delegate = self
        tblview.dataSource = self
        tblview.refreshControl = UIRefreshControl()
        tblview.refreshControl?.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    }
    
    @objc private func reloadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.fillUpData()
            self.tblview.reloadData()
            self.tblview.refreshControl?.endRefreshing()
        }
    }
}

extension PullToRefreshViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "StoresCell", for: indexPath)
        if let cell = cell as? StoresCell {
            cell.config(with: stores[indexPath.row])
            return cell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension UIView {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
