//
//  LoginViewController.swift
//  o_X
//
//  Created by Tanmay Bhatia on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
   
    func loginAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let dismiss = UIAlertAction (title: "Dismiss", style: .Cancel, handler: nil)
        alert.addAction(dismiss)
        presentViewController(alert, animated: true, completion:nil )
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        let users = UserController.sharedInstance
        users.login(email: usernameField.text!, password: passwordField.text!) { user, message in
            if user != nil {
                let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                let window = UIApplication.sharedApplication().keyWindow
                window?.rootViewController = controller
            } else {
                self.loginAlert(message!)
            }
        }
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


