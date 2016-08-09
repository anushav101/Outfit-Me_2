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
        query.whereKey("user", equalTo: PFUser.currentUser()!)
        query.orderByDescending("createdAt")
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

    @IBAction func addOutfit(sender: AnyObject) {
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("OutfitBuilderViewController") // again change to your view
        self.navigationController?.pushViewController(vc as! OutfitBuilderViewController, animated: true)
        
    }
 


}


extension OutfitViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedObjects.count

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: OutfitTableViewCell = tableView.dequeueReusableCellWithIdentifier("Outfits", forIndexPath: indexPath) as! OutfitTableViewCell
        
        let object = storedObjects[indexPath.row]
        cell.checkMark.hidden = true
        if (object["share"] != nil) {
           if (object["share"] as! String == "true"){
                cell.checkMark.hidden = false
            }
        }
        if (object["images"] != nil){
        cell.collectionImages = object["images"] as! [PFFile]
        }
        cell.outfitObject.append(object)
        cell.tableIndexPath = indexPath.row
        cell.collectionView.reloadData()
        cell.outfitNumber.text = "Outfit # \(storedObjects.count - indexPath.row )"
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       
        if editingStyle == .Delete {
            
            print("NOTE DELETED !!!!!!!")
            print("REMOVING AT INDEX: \(indexPath.row))")
            let query = PFQuery(className: "Outfits")
            let object = storedObjects[indexPath.row]
            storedObjects.removeAtIndex(indexPath.row)
//            self.tableView.reloadData()
            query.whereKey("objectId", equalTo: object.objectId!)
        
            query.findObjectsInBackgroundWithBlock {
                (objects: [PFObject]?, error: NSError?) -> Void in
                for item in objects! {
//                    item.deleteEventually()
                    item.deleteInBackgroundWithBlock({(success: Bool, error: NSError?)-> Void in
                        if (success) {
                            
                            
                            print("SUCCESS")
                            dispatch_async(dispatch_get_main_queue()) {
                                self.tableView.reloadData()
                            }

                        }
                        else {
                            print("CANNOT DELETE")
                        }
                    })
                    
                }
//                self.tableView.reloadData()
            }
        }
        
        
        
        
        
    }
    
//        let triggerTime = (Int64(NSEC_PER_SEC) * 1)
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
//            
//            self.tableView.reloadData()
//            
//        })
//        
//        
//        
//    }

}













