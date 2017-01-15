//
//  Invitation.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation

class Invitation
{
    let inviteKey: String
    let sender: String
    let receiver: String
    
    init(inviteKey: String, sender: String, receiver: String)
    {
        self.inviteKey = inviteKey
        self.sender = sender
        self.receiver = receiver
    }
    
    func sendInvitationToFire()
    {
        
    }
    
    
}// end class

