//
//  BottomsDataSource.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class BottomsDataProvider: NSObject, UICollectionViewDataSource {
    
    var images: [UIImage] = []
    
    override init() {
        super.init()
        for _ in 0..<10 {
            let image = UIImage(named: "puppy .jpg")
            images.append(image!)
        }
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
}