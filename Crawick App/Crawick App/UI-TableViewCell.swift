//
//  TableViewCell.swift
//  Crawick App
//
//  Created by Steven Gibson on 25/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imgExhibit: UIImageView!
    
    @IBOutlet var lblExhibit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
