//
//  OutfitBuilderDataProvider.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/29/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

var objectsToOutfit: [PFObject] = []


class OutfitBuilderDataProvider: NSObject {
    
//    static let sharedInstance = OutfitBuilderDataProvider()
    
    
    
    var storedObjects: [PFObject] = [] {
        didSet {
            print("did set storedObjects: \(storedObjects)")
        }
    }
    
    var category: String {
        return ""
    }

    
    func getAllClothing(success: (Bool) -> Void) {
        let query = PFQuery(className: "Product")
        query.orderByAscending("createdAt")
        query.whereKey("category", equalTo: category)
        query.whereKey("user", equalTo: PFUser.currentUser()!)
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.storedObjects = objects ?? []
            
            success(true)
        }
//        print("STORED OBJECTS: \(storedObjects)")
    }
}


extension OutfitBuilderDataProvider: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storedObjects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OutfitCollectionViewCell", forIndexPath: indexPath) as! OutfitBuilderCollectionViewCell
       
        cell.setTheImageView(storedObjects[indexPath.row])
        

        
        if objectsToOutfit.contains(storedObjects[indexPath.row]){
            cell.layer.borderWidth = 6.0
            cell.layer.borderColor = UIColor.cyanColor().CGColor
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        
        if objectsToOutfit.contains(storedObjects[indexPath.row]) && (cell!.layer.borderWidth == 6) {
            cell!.layer.borderWidth = 0
            var i = -1
            for object in objectsToOutfit {
                i += 1
                if self.storedObjects[indexPath.row] == object {
                    objectsToOutfit.removeAtIndex(i)
                }
            }
            
        }
        else {
            
            cell!.layer.borderWidth = 6.0
            //        cell!.layer.borderColor = UIColor.grayColor().CGColor
            cell!.layer.borderColor = UIColor.cyanColor().CGColor
            objectsToOutfit.append(self.storedObjects[indexPath.row])
//            print(objectsToOutfit)
//            print("THIS IS COLLECTION VIEW INDEX!")
//            print(indexPath.row)
        }
        
    }
    
}























