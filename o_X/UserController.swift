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
    
    func register(email email: String, password: String, onCompletion: (User?, String?) -> Void){
        if ( password.characters.count >= 6){
            currentUser = User(email: email, password: password)
            users.append(currentUser!)
            onCompletion(currentUser, nil)
        }
        else {
            onCompletion(nil, "Password should be 6 characters.")
        }
    }
    
    func login(email email: String, password: String, onCompletion: (User?, String?) -> Void) {
        for user in users {
            if (user.email == email) {
                if (user.password == password) {
                    currentUser = user
                    onCompletion(user, nil)
                } else {
                    onCompletion(nil, "Incorrect password.")
                }
                
                return
            }
        }
        onCompletion(nil, "Email not registered.")
    }
    
    func logout(onCompletion onCompletion: (String?) -> Void) {
        currentUser = nil
        onCompletion("Bye Bye")
    }
}
