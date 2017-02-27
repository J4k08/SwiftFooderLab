//
//  MyCustomTableViewCell.swift
//  SwiftLabb1
//
//  Created by Jakob Haglöf on 2017-02-23.
//  Copyright © 2017 Jakob Haglöf. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    var numberOfRow : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
