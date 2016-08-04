//
//  OutfitViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/3/16.


import UIKit
import Parse

class OutfitViewController: UIViewController {
    
    var storedObjects : [PFObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    
    override func viewWillAppear(animated: Bool) {
        let query = PFQuery(className: "Outfits")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error:  NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.storedObjects = objects ?? []
            self.tableView.reloadData()
            

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBOutlet weak var tableView: UITableView!

 

}


extension OutfitViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedObjects.count

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: OutfitTableViewCell = tableView.dequeueReusableCellWithIdentifier("Outfits", forIndexPath: indexPath) as! OutfitTableViewCell
        
        var object = storedObjects[indexPath.row]
        
        cell.collectionImages = object["images"] as! [PFFile]
        print(cell.collectionImages)
        cell.outfitNumber.text = "Outfit # \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       
        if editingStyle == .Delete {
           print("NOTE DELETED !!!!!!!")
            let query = PFQuery(className: "Outfits")
            let object = storedObjects[indexPath.row]
            storedObjects.removeAtIndex(indexPath.row)
            query.whereKey("objectId", equalTo: object.objectId!)
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                for object in objects! {
                    object.deleteEventually()
                    
                }
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                
            })
            
//            let triggerTime = (Int64(NSEC_PER_SEC) * 1)
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
//                
//                
//               self.tableView.reloadData()
//                print("delete this!!!")
//                
//            })
            
        }
        
        
        
        
        
    }

}













