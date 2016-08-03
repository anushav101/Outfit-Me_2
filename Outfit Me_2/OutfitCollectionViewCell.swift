//
//  OutfitCollectionViewCell.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/3/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class OutfitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func setTheImageView(userPicture: PFFile) {
        
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
    
    
}
