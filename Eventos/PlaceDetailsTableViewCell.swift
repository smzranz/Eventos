//
//  PlaceDetailsTableViewCell.swift
//  KochiMetro
//
//  Created by Shamshir Anees on 04/04/17.
//  Copyright © 2017 Citrus. All rights reserved.
//

import UIKit

class PlaceDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var detaillabel: UILabel!
    @IBOutlet weak var PlaceDetailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
