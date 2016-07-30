//
//  OutfitBuilderTableViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/29/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class OutfitBuilderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.dataSource = nil
    }
}

