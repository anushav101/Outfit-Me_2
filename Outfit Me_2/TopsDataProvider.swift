//
//  TopsDataProvider.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit


class TopsDataProvider: NSObject, UICollectionViewDataSource {
    
    static var images: [UIImage] = []
    
    override init() {
        super.init()
        for i in 0..<10 {
            let image = UIImage(named: "puppy .jpg")
            let kittenImage = UIImage(named: "kitten.jpg")
            if i%2 == 0 {
                TopsDataProvider.images.append(image!)
            }
            else {
                TopsDataProvider.images.append(kittenImage!)
                
            }
        }
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopsDataProvider.images.count
    }

    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        let image = TopsDataProvider.images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
}