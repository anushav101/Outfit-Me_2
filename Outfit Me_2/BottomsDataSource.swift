//
//  BottomsDataSource.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

import UIKit
import Parse

class BottomsDataProvider: ClothingDataProvider {
    
    
    override var category: String {
        return "Bottoms"
    }
    
    static let sharedInstance = BottomsDataProvider()
    
    
    }


