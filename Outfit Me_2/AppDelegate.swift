//
//  AppDelegate.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 7/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let configuration = ParseClientConfiguration {
            let APP_ID = "OutfitMe"
            let SERVER_URL = "https://outfitme-parse-av.herokuapp.com/parse"
            
            $0.applicationId = APP_ID
            $0.server = SERVER_URL
        }
        
        Parse.initializeWithConfiguration(configuration)
        
        let acl = PFACL()
        acl.publicReadAccess = true
        PFACL.setDefaultACL(acl, withAccessForCurrentUser: true)
        
      
        
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            var initialViewController = storyboard.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        }
        else {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            var initialViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
        }
        
        
        
<<<<<<< HEAD
        //
        
        let imageData = UIImageJPEGRepresentation(UIImage(named:"trash")!, 0.8)!
        let imageFile = PFFile(name: "image.jpg", data: imageData)
        
        let testObject = PFObject(className: "Product")
        
        // TODO: Make this dynamic (with respect to cell row)
        //        let cellValue = self.tableView.indexPathForCell(cell)!.row
        //        let dataProvider = self.categoryDataProvider[cellValue]
        testObject["category"] = "Top"
        testObject["imageFile"] = imageFile
        testObject["user"] = PFUser.currentUser()
        
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Object has been saved.")
                //                dataProvider.getAllClothing({ (success: Bool) in
                //                    dispatch_async(dispatch_get_main_queue(), {
                //                        if let indexPath = self.tableView.indexPathForCell(cell) where success {
                //                            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                //                        }
                //                    })
                //                })
                //                
                
            }
            else {
                print(error)
            }
        }
        
        
        
        
        
        
=======

>>>>>>> origin/master
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

