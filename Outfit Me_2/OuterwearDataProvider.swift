//
//  OuterwearDataProvider.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/29/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class OuterwearOutfitProvider: OutfitBuilderDataProvider {
    
    override var category: String {
        return "Outerwear"
    }
    
    static let sharedInstance = OuterwearOutfitProvider()
    
    
    
}

