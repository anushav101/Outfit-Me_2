//
//  FeedTableViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/8/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var outfitObject: [PFObject] = []
    
    
    @IBOutlet weak var loveCountLabel: UILabel!
    @IBOutlet weak var winkCountLabel: UILabel!
    @IBOutlet weak var coolCountLabel: UILabel!
    @IBOutlet weak var indifferentCountLabel: UILabel!
    @IBOutlet weak var deadCountLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //        collectionView.dataSource = nil
    }
    
    
    var collectionImages: [PFFile] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func love(sender: AnyObject) {
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        print("BUTTON PRESSED!!")
        
        
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["loveCount"] != nil){
                    let num = object["loveCount"] as! Int
                    object["loveCount"] = num + 1
                }
                else{
                    object["loveCount"] = 1
                }
              
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        self.loveCountLabel.text = "\(object["loveCount"])"
                       
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }
    }

    @IBAction func wink(sender: AnyObject) {
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["winkCount"] != nil){
                    let num = object["winkCount"] as! Int
                    object["winkCount"] = num + 1
                }
                else{
                    object["winkCount"] = 1
                }
                
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        self.winkCountLabel.text = "\(object["winkCount"])"
                        
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }
    }
  
    @IBAction func cool(sender: AnyObject) {
        
        
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["coolCount"] != nil){
                    let num = object["coolCount"] as! Int
                    object["coolCount"] = num + 1
                }
                else{
                    object["coolCount"] = 1
                }
                
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        self.coolCountLabel.text = "\(object["coolCount"])"
                        
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }
    }
    
    @IBAction func indifferent(sender: AnyObject) {
        
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["indifferentCount"] != nil){
                    let num = object["indifferentCount"] as! Int
                    object["indifferentCount"] = num + 1
                }
                else{
                    object["indifferentCount"] = 1
                }
                
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        self.indifferentCountLabel.text = "\(object["indifferentCount"])"
                        
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }

        
        
    }
    
    
    
    @IBAction func dead(sender: AnyObject) {
        
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["deadCount"] != nil){
                    let num = object["deadCount"] as! Int
                    object["deadCount"] = num + 1
                }
                else{
                    object["deadCount"] = 1
                }
                
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        self.deadCountLabel.text = "\(object["deadCount"])"
                        
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }

    }
    
    
    @IBAction func flagContent(sender: AnyObject) {
        
        let object = outfitObject[0]
        let query = PFQuery(className: "Outfits")
        query.whereKey("objectId", equalTo: (object.objectId)!)
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                if (object["flagCount"] != nil){
                    let num = object["flagCount"] as! Int
                    object["flagCount"] = num + 1
                }
                else{
                    object["flagCount"] = 1
                }
                
                object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                    if success {
                        print("Object has been saved.")
                        
                    }
                    else {
                        print(error)
                    }
                }
            }
            
        }
        
    }
    
    
    
    
}

extension FeedTableViewCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImages.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier( "FeedCollectionCell", forIndexPath: indexPath) as! FeedCollectionViewCell
        let image = collectionImages[indexPath.row]
        cell.setTheImageView(image)
        return cell

    }
}
