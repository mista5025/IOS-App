//
//  TravelTableViewCell.swift
//  ProjectA
//
//  Created by Lawrence Bang on 8/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class TravelTableViewCell: UITableViewCell {


    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
