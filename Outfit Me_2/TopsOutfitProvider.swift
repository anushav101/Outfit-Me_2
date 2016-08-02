//
//  TopsOutfitProvider.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/29/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class TopsOutfitProvider: OutfitBuilderDataProvider {
    
    override var category: String {
        return "Tops"
    }
    
  static let sharedInstance = TopsOutfitProvider()
    
    
    
}
