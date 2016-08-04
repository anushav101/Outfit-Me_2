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
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var gotitButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!

    
    
    @IBAction func cancelPressed(sender: UIButton) {
        print("HI")
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            () -> Void in
            self.modalView.alpha = 0
            self.modalView.hidden = false
            
        }) { (completed) in
            
        }

    }
    
    
    
    @IBAction func gotitPressed(sender: UIButton) {
        print("HI")
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            () -> Void in
            self.modalView.alpha = 0
            self.modalView.hidden = false
            
        }) { (completed) in
            
        }

    
        // delete code here
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
        
        objectsToDelete = []
        
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
    @IBOutlet weak var tableView: UITableView!
    var photoTakingHelper: PhotoTakingHelper!
    
    
    
    @IBAction func deleteClothing(sender: AnyObject) {
        
        if (objectsToDelete.count > 1) {
            messageLabel.text = "You are about to delete \(objectsToDelete.count) items"
        }
        else{
            messageLabel.text = "You are about to delete \(objectsToDelete.count) item"
        }
        
        if (objectsToDelete.count == 0) {
            return
        }
        else {
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                () -> Void in
                self.modalView.alpha = 1
                self.modalView.hidden = false
                
            }) { (completed) in
                
            }
        
        }
    
  
        
        
        
    }

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parsePhoto = ParsePhotos()
        // Do any additional setup after loading the view, typically from a nib.
//        self.modalView.frame.origin = CGPoint(x: 175,y: 603)
        self.modalView.hidden = true
        self.modalView.layer.zPosition = 5
        gotitButton.layer.zPosition = 5
        cancelButton.layer.zPosition = 5
        messageLabel.layer.zPosition = 5
        // Customize the modal view container
        modalView.backgroundColor = UIColor.whiteColor()
        modalView.layer.cornerRadius = 15
        modalView.alpha = 0
        
        // Customize the button in the modal view
        gotitButton.layer.cornerRadius = 10
        gotitButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        gotitButton.backgroundColor = UIColor(colorLiteralRed: 0/255, green: 153/255, blue: 255/255, alpha: 0.75)
        
        // Customize the message label on the modal
       
        messageLabel.textColor = UIColor.darkGrayColor()
        
        cancelButton.layer.cornerRadius = 10
        cancelButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cancelButton.backgroundColor = UIColor(colorLiteralRed: 0/255, green: 153/255, blue: 255/255, alpha: 0.75)

        
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
            
            let imageData = UIImageJPEGRepresentation(image, 0.8)!
            let imageFile = PFFile(name: "image.jpg", data: imageData)!
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
 
        }
    }
}














