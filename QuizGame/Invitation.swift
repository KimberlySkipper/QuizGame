//
//  Invitation.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation
import Firebase

class Invitation
{
    var inviteKey: String?
    let sender: String
    let receiver: String
    
    var dbRef: FIRDatabaseReference!
    
    init(sender: String, receiver: String)
    {
        self.sender = sender
        self.receiver = receiver
    }
    
    static func createInvitationFromJsonDictionary(_ aDictionaryMadeFromFBDatabase: [String: Any]) -> Invitation?
    {
        var anInvitation: Invitation?
        
        if aDictionaryMadeFromFBDatabase.count > 0
        {
            let sender = aDictionaryMadeFromFBDatabase["sender"] as? String ?? ""
            let receiver = aDictionaryMadeFromFBDatabase["receiver"] as? String ?? ""
            anInvitation = Invitation(sender: sender, receiver: receiver)
        }
        return anInvitation
        
    }

    
    func sendInvitationToFire()
    {
        dbRef = FIRDatabase.database().reference()
        let inviteInfo: [String: Any] = ["sender": sender,
                                         "receiver": receiver]
        dbRef.child("invitations").childByAutoId().setValue(inviteInfo)
        
    }
    
    
    func sendEditToFirebase()
    {
        dbRef = FIRDatabase.database().reference()
        let inviteInfo: [String: Any] = ["sender": sender,
                                         "receiver": receiver]
    
        dbRef.child("invitations").child(inviteKey!).setValue(inviteInfo)
        
    }

    
    
}// end class

// AppState.sharedInstance.displayName = user?.displayName



