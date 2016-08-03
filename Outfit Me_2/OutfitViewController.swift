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
}












