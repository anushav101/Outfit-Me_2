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
    var categoryDataProvider = [TopsDataProvider.sharedInstance, BottomsDataProvider.sharedInstance, OuterwearDataProvider.sharedInstance, DressesDataProvider.sharedInstance, AccessoriesDataProvider.sharedInstance, ShoesDataProvider.sharedInstance]
    
    
    @IBOutlet weak var tableView: UITableView!
    var photoTakingHelper: PhotoTakingHelper!
    
    
    @IBAction func deleteClothing(sender: AnyObject) {
        
        for object in objectsToDelete {
            let query = PFQuery(className: "Product")
            query.whereKey("objectId", equalTo: (object.objectId)!)
            query.findObjectsInBackgroundWithBlock {
                (objects:[PFObject]?, error: NSError?) -> Void in
                for object in objects! {
                    object.deleteEventually()
                }
            }
            
        }
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 1)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
            TopsDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            
            BottomsDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            
            OuterwearDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            
            DressesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            
            AccessoriesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            
            ShoesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
                if success {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
            

        })
        
        
        
    }

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parsePhoto = ParsePhotos()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        TopsDataProvider.sharedInstance.getAllClothing { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        }

        BottomsDataProvider.sharedInstance.getAllClothing { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.tableView.reloadData()
                })
            }
        }
        
        OuterwearDataProvider.sharedInstance.getAllClothing { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        }
        
        DressesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        }
        
        AccessoriesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
            if success {
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            }
        }
        
        ShoesDataProvider.sharedInstance.getAllClothing { (success: Bool) in
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
        cell.titleLabel.text = categoryDataProvider[indexPath.row].category     
        cell.collectionView.dataSource = categoryDataProvider[indexPath.row]
        cell.collectionView.delegate = categoryDataProvider[indexPath.row]
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
            
//            let imageData = UIImageJPEGRepresentation(image, 0.8)!
            let imageData = UIImageJPEGRepresentation(UIImage(named:"trash")!, 0.8)!
            do {
            let imageFile = try PFFile(name: "image.jpg", data: imageData, contentType: "image/jpeg")
            
            let testObject = PFObject(className: "Product")
            
            // TODO: Make this dynamic (with respect to cell row)
            let cellValue = self.tableView.indexPathForCell(cell)!.row
            let dataProvider = self.categoryDataProvider[cellValue]
            testObject["category"] = dataProvider.category
            testObject["imageFile"] = imageFile
            testObject["user"] = PFUser.currentUser()
            
            testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success {
                    print("Object has been saved.")
                    dataProvider.getAllClothing({ (success: Bool) in
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
                
            } catch {
                print("there was an error with image upload")
            }
        }
    }
}














