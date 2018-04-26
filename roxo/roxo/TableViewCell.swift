//
//  TableViewCell.swift
//  roxo
//
//  Created by bruno on 25/04/18.
//  Copyright © 2018 bruno. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var foto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foto.layer.borderColor = UIColor(displayP3Red: 164/255, green: 99/255, blue: 1, alpha: 1).cgColor
        foto.layer.masksToBounds = false
        foto.layer.borderWidth = 3
        foto.layer.cornerRadius = foto.frame.width/2
        foto.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
