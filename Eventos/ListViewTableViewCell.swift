//
//  ListViewTableViewCell.swift
//  Eventos
//
//  Created by Shamshir on 15/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    
    
    @IBOutlet weak var titleName: UILabel!
    
    
    @IBOutlet weak var reviewsCount: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    
    @IBOutlet weak var star1: UIImageView!
     @IBOutlet weak var star2: UIImageView!
     @IBOutlet weak var star3: UIImageView!
     @IBOutlet weak var star4: UIImageView!
     @IBOutlet weak var star5: UIImageView!
    
    
    @IBOutlet weak var favariteBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
