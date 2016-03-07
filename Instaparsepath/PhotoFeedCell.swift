//
//  PhotoFeedCell.swift
//  Instaparsepath
//
//  Created by Michael Ceraso on 3/7/16.
//  Copyright © 2016 Michael Ceraso. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoFeedCell: UITableViewCell {

    @IBOutlet weak var photoImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
