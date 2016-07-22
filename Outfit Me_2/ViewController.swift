//
//  ViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var categoryString = ["Tops", "Bottoms", "Outerwear", "Dresses", "Accessories", "Shoes"]
    
    @IBOutlet weak var tableView: UITableView!
    var photoTakingHelper: PhotoTakingHelper!
    
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
    
    override func viewWillAppear(animated: Bool) {
        TopsDataProvider.sharedInstance.getAllTops { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()
                })
            }
        }
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
        cell.delegate = self
        cell.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        if indexPath.row == 0{
            cell.titleLabel.text = "Tops"
            cell.collectionView.dataSource = TopsDataProvider.sharedInstance
            
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

extension ViewController: TableViewCellDelegate {
    

    
    func takePhotoFromCell(cell: TableViewCell) {
        self.photoTakingHelper = PhotoTakingHelper(viewController: self) { (image: UIImage?) in
            guard let image = image else {
                return
            }
            
            let imageData = UIImageJPEGRepresentation(image, 0.8)!
            let imageFile = PFFile(name: "image.jpg", data: imageData)!
            let testObject = PFObject(className: "Product")
            
            // TODO: Make this dynamic (with respect to cell row)
            var cellValue = self.tableView.indexPathForCell(cell)!
            print("THEEEE CELLLLL VALUEEEEE ISSSSSSSS  \(cellValue.row)")
            testObject["category"] = self.categoryString[cellValue.row]
            testObject["imageFile"] = imageFile
            
            testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success {
                    print("Object has been saved.")
                    TopsDataProvider.sharedInstance.getAllTops({ (success: Bool) in
                        dispatch_async(dispatch_get_main_queue(), {
                            if let indexPath = self.tableView.indexPathForCell(cell) where success {
                                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                            }
                        })
                    })
                    
                    
                }
                else {
                    print(error)
                }
            }
 
        }
    }
}














