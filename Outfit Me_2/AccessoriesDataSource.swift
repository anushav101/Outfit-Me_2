//
//  AccessoriesDataSource.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class AccessoriesDataProvider: ClothingDataProvider {
    
    
    override var category: String {
        return "Accessories"
    }
    
    static let sharedInstance = AccessoriesDataProvider()
    
    
}