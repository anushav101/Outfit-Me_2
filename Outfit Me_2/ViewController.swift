//
//  ViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let topsDataProvider = TopsDataProvider()
    let bottomsDataProvider = BottomsDataProvider()
    let outerwearDataProvider = OuterwearDataProvider()
    let dressesDataProvider = DressesDataProvider()
    let accessoriesDataProvider = AccessoriesDataProvider()
    let shoesDataProvider = ShoesDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parsePhoto = ParsePhotos()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier("Categories", forIndexPath: indexPath) as! TableViewCell
        cell.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        if indexPath.row == 0{
            cell.titleLabel.text = "Tops"
            cell.collectionView.dataSource = topsDataProvider
            cell.parentViewController = self
            
        }
            
        else if indexPath.row == 1{
            cell.titleLabel.text = "Bottoms"
            cell.collectionView.dataSource = bottomsDataProvider
            
        }
        else if indexPath.row == 2{
            cell.titleLabel.text = "Outerwear"
            cell.collectionView.dataSource = outerwearDataProvider
        }
        else if indexPath.row == 3{
            cell.titleLabel.text = "Dresses"
            cell.collectionView.dataSource = dressesDataProvider

        }
        else if indexPath.row == 4{
            cell.titleLabel.text = "Accessories"
            cell.collectionView.dataSource = accessoriesDataProvider
        }
        else if indexPath.row == 5{
            cell.titleLabel.text = "Shoes"
            cell.collectionView.dataSource = shoesDataProvider
        }
        
        else {
        }
        
        print("ViewController - cellForRowAtIndexPath - \(cell.collectionView.dataSource)")
        return cell

        
    }
    
//    override func tableView(tableView: UITableView,
//                            willDisplayCell cell: UITableViewCell,
//                                            forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        guard let tableViewCell = cell as? TableViewCell else { return }
//        
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//    }
}














