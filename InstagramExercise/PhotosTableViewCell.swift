//
//  PhotosTableViewCell.swift
//  InstagramExercise
//
//  Created by Rachana Bedekar on 4/16/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
