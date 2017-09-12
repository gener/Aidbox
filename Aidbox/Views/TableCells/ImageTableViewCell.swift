//
//  ImageTableViewCell.swift
//  Aidbox
//
//  Created by Eugene Kalyada on 12.09.17.
//  Copyright © 2017 Eugene Kalyada. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	override func layoutSubviews() {
		super.layoutSubviews()
		if let imageView  = imageView {
			imageView.center = center
			imageView.layer.cornerRadius = imageView.frame.height / 2
			separatorInset = UIEdgeInsetsMake(0, frame.width, 0, 0)
		}

	}

}
