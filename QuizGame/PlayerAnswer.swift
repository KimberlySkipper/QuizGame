//
//  Answer.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation

class PlayerAnswer
{
    let answer: String
    let timeAnswered: Double
    let isCorrect: Bool
    
    init (answer: String, timeAnswered: Double, isCorrect: Bool)
    {
        self.answer = answer
        self.timeAnswered = timeAnswered
        self.isCorrect = isCorrect
    }
    
}// end class
