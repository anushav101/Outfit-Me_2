//
//  TableViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

//import UIKit
//
//class TableViewCell: UITableViewCell {
//
//    @IBOutlet private weak var collectionView: UICollectionView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    func setCollectionViewDataSourceDelegate
//        <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>
//        (dataSourceDelegate: D, forRow row: Int) {
//        
//        collectionView.delegate = dataSourceDelegate
//        collectionView.dataSource = dataSourceDelegate
//        collectionView.tag = row
//        collectionView.reloadData()
//    }
//
//}


import UIKit

class TableViewCell: UITableViewCell {
    
    var parentViewController: UIViewController!
    var photoTakingHelper: PhotoTakingHelper!
   
    
    @IBOutlet weak var titleLabel: UILabel!
        
    @IBAction func addPicture(sender: AnyObject) {
        print("Add Picture Button Pressed.")
        self.photoTakingHelper = PhotoTakingHelper(viewController: self.parentViewController!) { (image: UIImage?) in
            print("being called")
            TopsDataProvider.images.append(image!)
            print("AMOUNT IN TOPS ARRAY:  \( TopsDataProvider.images.count)")
            dispatch_async(dispatch_get_main_queue(), { 
                self.collectionView.reloadData()
            })
            
    }
        
        
        
        
    }
    
//    var collectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.dataSource = nil
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // MARK: UICollectionViewDataSource
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        return 10
//    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) 
    
        
       
            //as! UICollectionViewCell
//        if indexPath.row%2 == 0 {
//            cell.backgroundColor = UIColor.redColor()
//        } else {
//            cell.backgroundColor = UIColor.yellowColor()
//        }
        
//        return cell
    //}
}
