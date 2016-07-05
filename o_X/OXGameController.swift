//
//  OXGameController.swift
//  o_X
//
//  Created by Tanmay Bhatia on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

class OXGameController: NSObject {
    
    static var sharedInstance = OXGameController()
    private var currentGame = OXGame()
    
    func getCurrentGame() -> OXGame {
        return currentGame
    }
    
    func restartGame() {
        getCurrentGame().reset()
    }
    
    func playMove(Cell: Int) -> OXGame.CellType {
        return getCurrentGame().playMove(Cell)
    }
    
    func gameState() -> OXGame.OXGameState {
        return currentGame.state()
    }
    
    func getGames(onCompletion onCompletion: ([OXGame]?, String?) -> Void) {
        let a = OXGame()
        let b = OXGame()
        let c = OXGame()
        
        a.ID = 23
    
        a.host = "hello"
        
        b.ID = 11
        b.host = "hey"
        c.ID = 22
        c.host = "hi"
        
        onCompletion([a,b,c], nil)
    }
    
    
}