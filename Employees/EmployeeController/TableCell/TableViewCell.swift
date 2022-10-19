//
//  TableViewCell.swift
//  Employees
//
//  Created by Sathya on 24/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var company: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
