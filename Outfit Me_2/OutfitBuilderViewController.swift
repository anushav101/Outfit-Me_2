//
//  OutfitBuilderViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/28/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

class OutfitBuilderViewController: UIViewController {
    
    var categoryDataProvider = [TopsDataProvider.sharedInstance, BottomsDataProvider.sharedInstance, OuterwearDataProvider.sharedInstance, DressesDataProvider.sharedInstance, AccessoriesDataProvider.sharedInstance, ShoesDataProvider.sharedInstance]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension OutfitBuilderViewController: UITableViewDataSource{
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("OutfitCategories", forIndexPath: indexPath)
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

