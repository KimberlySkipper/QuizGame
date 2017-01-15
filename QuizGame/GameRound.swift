//
//  GameRounds.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation

class GameRound
{
    var gameRoundsKey: String?
    var question: String?
    var correctAnswer: String?
    var playerOneAns: PlayerAnswer?
    var playerTwoAns: PlayerAnswer?
    
    init (question: String, correctAnswer: String)
    {
        self.question = question
        self.correctAnswer = correctAnswer
    }
    
    init (gameRoundsKey: String, question: String, correctAnswer: String, playerOneAns: PlayerAnswer, playerTwoAns: PlayerAnswer)
    {
        self.gameRoundsKey = gameRoundsKey
        self.question = question
        self.correctAnswer = correctAnswer
        self.playerOneAns = playerOneAns
        self.playerTwoAns = playerTwoAns
    }
    
    
    //func gameRoundFrom
}// end class
