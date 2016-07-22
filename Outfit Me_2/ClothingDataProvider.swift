//
//  ClothingDataProvider.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class ClothingDataProvider : NSObject{
    
    
    var images: [UIImage] = []
    
    var category: String {
        return ""
    }
    
    func getAllClothing(success: (Bool) -> Void) {
        let query = PFQuery(className: "Product")
        query.whereKey("category", equalTo: category)
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print("objects: \(objects)")
            print("error: \(error)")
            
            if let actualObjects = objects {
                
                self.images = []
                
                // TODO: Move to cellForItemAtIndexPath in collection View
                for object in actualObjects {
                    
                    let userPicture = object["imageFile"] as! PFFile
                    userPicture.getDataInBackgroundWithBlock({
                        (imageData: NSData?, error: NSError?) -> Void in
                        if let error = error {
                            print(error.localizedDescription)
                            success(false)
                        } else {
                            let image = UIImage(data:imageData!)
                            self.images.append(image!)
                            success(true)
                        }
                    })
                }
            }
        }
    }

    
    
}

extension ClothingDataProvider: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        let image = images[indexPath.row]
        
        // insert loading logic here
        
        cell.imageView.image = image
        return cell
    }
}
