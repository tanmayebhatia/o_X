//
//  OXGAME.swift
//  o_X
//
//  Created by Tanmay Bhatia on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

class OXGame {
    enum CellType : String {
        case O = "O"
        case X = "X"
        case empty = ""
    }
    
    enum OXGameState {
        case inProgress
        case Tie
        case Won
        case open
        case abandoned
    }
    
    var ID: Int = 0
    var host: String = ""
    
    var board = [CellType](count: 9, repeatedValue: CellType.empty)
    private var startType:CellType = CellType.X
    var count:Int = 0
    
    func turnCount() -> Int {
        return count
    }
    
    func whoseTurn() -> CellType {
        if (turnCount() == 0 || turnCount()%2 == 0){
            return CellType.X
        }
        else {
            return CellType.O
        }
    }
    
    func playMove(boardCell:Int) -> CellType {
        //if board[boardCell] == CellType.empty{
        if (whoseTurn() == CellType.X){
            board[boardCell] = CellType.X
        }
        else{
            board[boardCell] = CellType.O
        }
        count += 1
        return board[boardCell]
        //}
        //return nil
    }
    
    func serialiseBoard() -> String {
        var string: String = ""
        for cell in board {
            if cell == .X {
                string.append("x" as Character)
            } else if cell == .O {
                string.append("o" as Character)
            } else {
                string.append("_" as Character)
            }
        }
        return string
    }
    
    func gameWon() -> Bool {
        //checks for rows
        if ((board[0] != CellType.empty && board[0] == board[1] && board[1] == board[2]) ||
            (board[3] != CellType.empty && board[3] == board[4] && board[4] == board[5]) ||
            (board[6] != CellType.empty && board[6] == board[7] && board[7] == board[8])){
            return true
        }
        //checks for columns
        if ((board[0] != CellType.empty && board[0] == board[3] && board[3] == board[6]) ||
            (board[1] != CellType.empty && board[1] == board[4] && board[4] == board[7]) ||
            (board[2] != CellType.empty && board[2] == board[5] && board[5] == board[8])){
            return true
        }
        //checks for diagonals
        if ((board[0] != CellType.empty && board[0] == board[4] && board[4] == board[8]) ||
            (board[2] != CellType.empty && board[2] == board[4] && board[4] == board[6])){
            return true
        }
        return false
    }
    
    func state() -> OXGameState {
        if (gameWon()){
            return OXGameState.Won
        }
        else if(count >= 9){
            return OXGameState.Tie
        }
        return OXGameState.inProgress
        
    }
    
    func reset() -> Void {
        board = [CellType](count: 9, repeatedValue: .empty)
        count = 0
    }
    
    func deserialiseBoard ( boardString:String) -> [CellType]
    {
     
        var board = [CellType]()
        for char in boardString.characters {
            if char == "x" {
                board.append(.X)
            }
            else if char == "o" {
                board.append(.O)
            }
            else {
                board.append(.empty)
            }
        }
        return board
        
    }
  

    


    
    
}
