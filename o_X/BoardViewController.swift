//
//  BoardViewController.swift
//  o_X
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    // Create additional IBOutlets here.
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var newgame: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func logoutbutton(sender: AnyObject) {
        print(" Log Out button pressed.")
    }
    @IBAction func newGameButtonPressed(sender: UIButton) {
        print("New game button pressed.")
    }
    
    @IBAction func buttonpress(sender: AnyObject) {
        print ("button \(sender.tag) pressed hi!")
    }
    // Create additional IBActions here.

}

