//
//  DynamicTableViewController.swift
//  LoginScreens
//
//  Created by Ahir on 30/03/24.
//

import UIKit

class DynamicTableViewController: UIViewController {
    
    @IBOutlet weak var tblview: UITableView!
    var descriptions = [
        "Learn whole you play story-based skill development games and exeperience AR based concepts.",
        "National level skill multi-skill competition.",
        "Let's put india first.",
        "A quality product marketed by ITC enduring value."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setups()
    }
    
    private func setups() {
        tblview.delegate = self
        tblview.dataSource = self
        let nib = UINib(nibName: "DynamicTableViewCell", bundle: nil)
        tblview.register(nib, forCellReuseIdentifier: DynamicTableViewCell.reuseIdentifier)
    }
    
//    private func
}

extension DynamicTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        descriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DynamicTableViewCell", for: indexPath) as? DynamicTableViewCell
        if let cell = cell {
            cell.configCell(with: descriptions[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
