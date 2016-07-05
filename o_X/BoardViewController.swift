//
//  BoardViewController.swift
//  o_X
//

import UIKit
class BoardViewController: UIViewController {
    //@IBOutlet weak var boardView: UIView!
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var newGameButton: UIButton!
    
    var networkStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !networkStatus {
            newGameButton.hidden = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        let controller = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController()
        let window = UIApplication.sharedApplication().keyWindow
        window?.rootViewController = controller}
    
    @IBAction func moveButtonLabel(sender: UIButton) {
        
        //print("button \(sender.tag) pressed")
        sender.userInteractionEnabled = false
        let game = OXGameController.sharedInstance.getCurrentGame()
        let cell = game.playMove(sender.tag)
         updateUI()
        
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
            
            if !networkStatus {
                newGameButton.hidden = false
            }
        }
        else if(game.state() == .Tie){
            let alert = UIAlertController(title: "You Tied", message: "You Tied", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            if !networkStatus {
                newGameButton.hidden = false
            }
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
                    button.userInteractionEnabled = true
                }
            }
            print("restarted game")
        }
    }
    
    @IBAction func newGameLabel(sender: UIButton) {
        restartGame()
        newGameButton.hidden = true
        print("new game pressed")
    }
    


func updateUI() {
    
    let currentGame = OXGameController.sharedInstance.getCurrentGame()
    
    print(currentGame.board[0])
    
    for case let button as UIButton in boardView.subviews {
        button.setTitle(currentGame.board[button.tag].rawValue, forState: .Normal)
        if currentGame.board[button.tag] != .empty {
            button.userInteractionEnabled = false
        }
    }
    
}
    
    @IBOutlet weak var networkStatusLabel: UILabel!
    func setNetworkLabelStatus() {
        if networkStatus {
            networkStatusLabel.text = "Network mode"
        }
        
    }
    
}


