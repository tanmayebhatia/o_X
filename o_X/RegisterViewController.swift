//
//  RegisterViewController.swift
//  o_X
//
//  Created by Tanmay Bhatia on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    func registerAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let dismiss = UIAlertAction (title: "Dismiss", style: .Cancel, handler: nil)
        alert.addAction(dismiss)
        presentViewController(alert, animated: true, completion:nil )
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        let users = UserController.sharedInstance
        users.register(email: usernameField.text!, password: passwordField.text!) { user, message in
            if user != nil {
                let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                let window = UIApplication.sharedApplication().keyWindow
                window?.rootViewController = controller
            } else {
                self.registerAlert(message!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
