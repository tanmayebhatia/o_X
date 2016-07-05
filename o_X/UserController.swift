//
//  UserController.swift
//  o_X
//
//  Created by Tanmay Bhatia on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class UserController {
    
    static var sharedInstance = UserController()
    private var users: [User] = []
    var currentUser: User?
    let data = NSUserDefaults.standardUserDefaults()
    
    
    func register(email email: String, password: String, onCompletion: (User?, String?) -> Void){
        if ( password.characters.count >= 6){
            currentUser = User(email: email, password: password)
            users.append(currentUser!)
            data.setObject(currentUser?.email, forKey: "CurrentUserEmail")
            data.setObject(currentUser?.password, forKey: "CurrentUserPassword")
            data.synchronize()
            onCompletion(currentUser, nil)
        }
        else {
            onCompletion(nil, "Password should be 6 characters.")
        }
    }
    
 
    
    func login(email email: String, password: String, onCompletion: (User?, String?) -> Void){
        for user in users{
            if (user.email == email && user.password == password){
                currentUser = user
                data.setObject(currentUser?.email, forKey: "currentUserEmail")
                data.setObject(currentUser?.password, forKey: "currentUserPassword")
                data.synchronize()
                onCompletion(user, nil)
                return
            }
        }
        
        onCompletion(nil, "Your username or password is incorrect.”")
    }
    
    func logout(onCompletion onCompletion: (String?) -> Void) {
        currentUser = nil
        data.removeObjectForKey("currentUserEmail")
        data.removeObjectForKey("currentUserPassword")
        data.synchronize()
        onCompletion("Logout Successful!")
    }
    
}


