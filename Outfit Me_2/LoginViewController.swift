//
//  LoginViewController.swift
//  Outfit Me_2
//
//  Created by Anusha Venkatesan on 8/5/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import Parse

var signedUp = false

class LoginViewController: UIViewController {
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.\
        confirmButton.titleLabel?.text! = "Sign Up"
        
        logInButton.layer.contents = 25
        let tap: UITapGestureRecognizer?
        tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap!)
        
        firstnameField.attributedPlaceholder = NSAttributedString(string:" firstname",
                                                              attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        lastnameField.attributedPlaceholder = NSAttributedString(string:" lastname",
                                                                  attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        usernameField.attributedPlaceholder = NSAttributedString(string:" username",
                                                                 attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        passwordField.attributedPlaceholder = NSAttributedString(string:" password",
                                                                 attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        
        logInButton.layer.cornerRadius = 15;
        signUpButton.layer.cornerRadius = 15;
        confirmButton.layer.borderWidth = 2;
        confirmButton.layer.borderColor = UIColor.whiteColor().CGColor
        confirmButton.layer.cornerRadius = 15;
        firstnameField.layer.cornerRadius = 16
        lastnameField.layer.cornerRadius = 16
        usernameField.layer.cornerRadius = 16
        passwordField.layer.cornerRadius = 16;
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func logInPressed(sender: UIButton) {
        
        
        
        self.firstnameField.hidden = true
        self.lastnameField.hidden = true
        self.logInButton.layer.zPosition = 5
        self.signUpButton.layer.zPosition = 0
        self.logInButton.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 223/255, blue: 200/255, alpha: 1)
        self.signUpButton.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        
        self.logInButton.setTitle("Log In", forState: UIControlState.Normal)
        self.logInButton.setTitle("Log In", forState: UIControlState.Highlighted)
        self.confirmButton.setTitle("Log In", forState: UIControlState.Normal)
        self.confirmButton.setTitle("Log In", forState: UIControlState.Highlighted)
        
        
    }
    
    
    @IBAction func signUpPressed(sender: UIButton) {
        
        
        self.firstnameField.hidden = false
        self.lastnameField.hidden = false
        self.logInButton.layer.zPosition = 0
        self.signUpButton.layer.zPosition = 5
        self.signUpButton.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 223/255, blue: 200/255, alpha: 1)
        
        self.logInButton.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        self.signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
        self.signUpButton.setTitle("Sign Up", forState: UIControlState.Highlighted)
        self.confirmButton.setTitle("Sign Up", forState: UIControlState.Normal)
        self.confirmButton.setTitle("Sign Up", forState: UIControlState.Highlighted)
        
        
        
        
        
    }
    
    @IBAction func confirmPressed(sender: UIButton) {
        
        if firstnameField.hidden == true {
            
            if usernameField.text != "" && passwordField.text != "" {
                
                PFUser.logInWithUsernameInBackground(usernameField.text!, password:passwordField.text!) {
                    (user: PFUser?, error: NSError?) -> Void in
                    if user != nil {
                        // Do stuff after successful login.
                        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController") // again change to your view
                        self.showViewController(vc as! UITabBarController, sender: vc) // change again
                        
                    } else {
                        // The login failed. Check error to see why.
                        let alert = UIAlertController(title: "Oops", message: "Something went wrong, try different information.", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
            }
            else {
                let alert = UIAlertController(title: "Sorry", message: "You need to fill out every field.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
            
            
        else {
            
            //put it here
            signedUp = true
            
            if usernameField.text != "" && passwordField.text != "" && firstnameField.text != "" && lastnameField.text != ""{
                
                
                
                var user = PFUser()
                user.username = usernameField.text
                user.password = passwordField.text
                user["firstName"] = firstnameField.text
                user["lastName"] = lastnameField.text
                
                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        let errorString = error.userInfo["error"] as? NSString
                        
                        print("UGH")
                    }
                    else {
                        
                        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController") // again change to your view
                        self.showViewController(vc as! UITabBarController, sender: vc) // change again
                        print("YES")
                    }
                }
            }
            else {
                let alert = UIAlertController(title: "Sorry", message: "You need to fill out every field.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
    }
    
}
