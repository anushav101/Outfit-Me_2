//
//  OutfitTableViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/3/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class OutfitTableViewCell: UITableViewCell {

    @IBOutlet weak var outfitNumber: UILabel!
    
    
    var collectionImages: [PFFile] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        collectionView.dataSource = nil
    }

    @IBOutlet weak var collectionView: UICollectionView!
}

extension OutfitTableViewCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier( "OutfitArticle", forIndexPath: indexPath) as! OutfitCollectionViewCell
        let image = collectionImages[indexPath.row]
        cell.setTheImageView(image)
        return cell
    }
}
