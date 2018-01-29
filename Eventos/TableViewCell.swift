//
//  TableViewCell.swift
//  Eventos
//
//  Created by Shamshir Anees on 27/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var cellImageView: UIImageView!
    
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
