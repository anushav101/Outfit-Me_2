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
    var outfitObject : [PFObject] = []
    var tableIndexPath = 0
    
    @IBOutlet weak var checkMark: UIImageView!
    
    
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
    @IBAction func shareOutfit(sender: AnyObject) {
        print("INDEX PATH: ")
        print(tableIndexPath)
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if(object["share"] != nil) {
                    if (object["share"] as! String == "true"){
                        object["share"] = "false"
                    }
                    else {
                        object["share"] = "true"
                    }
                    
                }
                else {
                object["share"] = "true"
                object["date"] = NSDate()
                }
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        if (object["share"] as! String == "true") {
                            self.checkMark.hidden = false
                        }
                        else {
                            self.checkMark.hidden = true
                        }
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }
        
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
