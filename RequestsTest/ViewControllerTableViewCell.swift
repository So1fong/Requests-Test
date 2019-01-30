//
//  ViewControllerTableViewCell.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 30.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var dmLabel: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
