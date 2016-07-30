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
    
    static let sharedInstance = OutfitBuilderDataProvider()
    
    
    
    var storedObjects: [PFObject] = [] {
        didSet {
            print("did set storedObjects: \(storedObjects)")
        }
    }
    
    var category: String {
        return "Tops"
    }

    
    func getAllClothing(success: (Bool) -> Void) {
        let query = PFQuery(className: "Product")
        query.orderByAscending("createdAt")
        query.whereKey("category", equalTo: category)
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.storedObjects = objects ?? []
            
            success(true)
        }
        print("STORED OBJECTS: \(storedObjects)")
    }
}


extension OutfitBuilderDataProvider: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storedObjects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OutfitCollectionViewCell", forIndexPath: indexPath) as! OutfitBuilderCollectionViewCell
       
        cell.setTheImageView(storedObjects[indexPath.row])
        
//        cell.setTheImageView(storedObjects[indexPath.row])
        
//        if objectsToDelete.contains(storedObjects[indexPath.row]){
//            cell.layer.borderWidth = 6.0
//            cell.layer.borderColor = UIColor.darkGrayColor().CGColor
//        }
        
        return cell
    }
}























