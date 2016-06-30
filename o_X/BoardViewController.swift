//
//  BoardViewController.swift
//  o_X
//

import UIKit
class BoardViewController: UIViewController {
    //@IBOutlet weak var boardView: UIView!
    
    @IBOutlet weak var boardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func moveButtonLabel(sender: UIButton) {
        
        //print("button \(sender.tag) pressed")
        sender.enabled = false
        let game = OXGameController.sharedInstance.getCurrentGame()
        let cell = game.playMove(sender.tag-1)
        
        
        sender.setTitle(cell.rawValue, forState: .Normal)
        
        if (game.state() == .Won){
            var winner = game.whoseTurn()
            if (winner == OXGame.CellType.X) {
                winner = OXGame.CellType.O
            }
            else if (winner == OXGame.CellType.O) {
                winner = OXGame.CellType.X
            }
            let alert = UIAlertController(title: "You Won", message: "player \(winner.rawValue)", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            
            print ("winner is \(game.whoseTurn().rawValue)")
            restartGame()
        }
        else if(game.state() == .Tie){
            let alert = UIAlertController(title: "You Tied", message: "You Tied", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            restartGame()
        } else {
            game.state() == .inProgress
        }

    }
    
    func restartGame() {
        OXGameController.sharedInstance.restartGame()
        for subview in boardView.subviews {
            if let button = subview as? UIButton {
                if (button.tag >= 0) {
                    button.setTitle("", forState: .Normal)
                    button.enabled = true
                }
            }
            print("restarted game")
        }
    }
    
    @IBAction func newGameLabel(sender: UIButton) {
        restartGame()
        print("new game pressed")
    }
    
}

