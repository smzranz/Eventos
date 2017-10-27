//
//  SearchHeaderTableViewCell.swift
//  Eventos
//
//  Created by Shamshir on 25/10/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class SearchHeaderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var searchView: UIButton!
    

    @IBOutlet weak var searchBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
