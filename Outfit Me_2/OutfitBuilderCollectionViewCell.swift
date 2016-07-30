//
//  OutfitBuilderCollectionViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/29/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class OutfitBuilderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setTheImageView(object: PFObject) {
        
        let userPicture = object["imageFile"] as! PFFile
        
        userPicture.getDataInBackgroundWithBlock({
            (imageData: NSData?, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
                
            else {
                let image = UIImage(data:imageData!)
                self.imageView.image = image
                
            }
            
        })
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        self.layer.borderWidth = 0
        
        
    }
    
}
