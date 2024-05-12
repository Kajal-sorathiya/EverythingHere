//
//  DynamicTableViewCell.swift
//  LoginScreens
//
//  Created by Ahir on 29/03/24.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(with description: String) {
        lblDescription.text = description
    }
    
}
