//
//  ReviewsTableViewCell.swift
//  KochiMetro
//
//  Created by Shamshir Anees on 04/04/17.
//  Copyright © 2017 Citrus. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!

    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
