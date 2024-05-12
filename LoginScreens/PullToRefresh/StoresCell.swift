//
//  StoresCell.swift
//  LoginScreens
//
//  Created by Ahir on 02/05/24.
//

import UIKit

class StoresCell: UITableViewCell {

    @IBOutlet private weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(with title: String) {
        lblTitle.text = title
    }
}
