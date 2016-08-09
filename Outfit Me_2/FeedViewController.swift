//
//  FeedViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/8/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController {
    
    var storedObjects: [PFObject] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let query = PFQuery(className: "Outfits")
        query.whereKey("share", equalTo: "true")
        query.includeKey("user")
        query.orderByDescending("date")
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
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension FeedViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedObjects.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCellWithIdentifier("FeedCell", forIndexPath: indexPath) as! FeedTableViewCell
        let object = storedObjects[indexPath.row]
        
//        let date = object["createdAt"]
        
        cell.outfitObject.append(object)
        cell.nameLabel.text = object["user"].username
        cell.dateLabel.text = "goodbye"
        if (object["loveCount"] != nil){
            cell.loveCountLabel.text = "\(object["loveCount"])"
        }
        else {
            cell.loveCountLabel.text = "0"
        }
        
        
        if (object["winkCount"] != nil){
            cell.winkCountLabel.text = "\(object["winkCount"])"
        }
        else {
            cell.winkCountLabel.text = "0"
        }
        
        if (object["coolCount"] != nil){
            cell.coolCountLabel.text = "\(object["coolCount"])"
        }
        else {
            cell.coolCountLabel.text = "0"
        }
        
        
        if (object["indifferentCount"] != nil){
            cell.indifferentCountLabel.text = "\(object["indifferentCount"])"
        }
        else {
            cell.indifferentCountLabel.text = "0"
        }
        
        
        
        
        if (object["deadCount"] != nil){
            cell.deadCountLabel.text = "\(object["deadCount"])"
        }
        else {
            cell.deadCountLabel.text = "0"
        }
        
        let date = object.createdAt!
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        let timeStamp = dateFormatter.stringFromDate(date)
        
        cell.dateLabel.text = timeStamp
        
        
        
        
        
        
        if (object["images"] != nil){
            cell.collectionImages = object["images"] as! [PFFile]
        }
        cell.collectionView.reloadData()
        return cell
    }
    

    
}














