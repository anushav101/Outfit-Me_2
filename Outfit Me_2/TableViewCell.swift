//
//  TableViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    func takePhotoFromCell(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: TableViewCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBAction func addPicture(sender: AnyObject) {
        print("Add Picture Button Pressed.")
        delegate?.takePhotoFromCell(self)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.dataSource = nil
    }
}
