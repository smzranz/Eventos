//
//  SocialMediaTableViewCell.swift
//  Eventos
//
//  Created by Shamshir on 31/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit

class SocialMediaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var facebookBtn: UIButton!
     @IBOutlet weak var youtubeBtn: UIButton!
     @IBOutlet weak var instagramBtn: UIButton!

     @IBOutlet weak var websiteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
