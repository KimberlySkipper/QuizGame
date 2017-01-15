//
//  Game.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation

class Game
{
    var gameKey: String?
    var playerOne: String?
    var playerTwo: String?
    var gameRounds = [GameRound]()
    
    init()
    {
    }
    
    init (gameKey: String, playerOne: String, playerTwo: String)
    {
        self.gameKey = gameKey
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    
    
}//end class


