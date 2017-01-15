//
//  User.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import Foundation
import Firebase

class User
{
    var userKey: String?
    let name: String
    let userName: String
    let available: Bool
    let gamesWon: Int
    
    var dbRef: FIRDatabaseReference!
    
    init (name: String, userName: String, available: Bool, gamesWon: Int)
    {
        
        self.name = name
        self.userName = userName
        self.available = available
        self.gamesWon = gamesWon
    }
    
    static func createUserFromJsonDictionary(_ aDictionaryMadeFromFBDatabase: [String: Any]) -> User?
    {
        var aUser: User?
        
        if aDictionaryMadeFromFBDatabase.count > 0
        {
            let name = aDictionaryMadeFromFBDatabase["name"] as? String ?? ""
            let userName = aDictionaryMadeFromFBDatabase["username"] as? String ?? ""
            let available = aDictionaryMadeFromFBDatabase["available"] as? Bool
            let gamesWon = aDictionaryMadeFromFBDatabase["gameswon"] as? Int ?? 0
            aUser = User(name: name, userName: userName, available: available!, gamesWon: gamesWon)
        }
        return aUser
    }

    
    
    
    func sendUserToFirebase()
    {
        dbRef = FIRDatabase.database().reference()
        let userInfo: [String: Any] = ["name": name,
        "username": userName,
        "available": available,
        "gameswon": gamesWon ]
        
        dbRef.child("users").childByAutoId().setValue(userInfo)
    }
    
    func sendEditToFirebase()
    {
        dbRef = FIRDatabase.database().reference()
        let userInfo: [String: Any] = ["name": name,
                                       "username": userName,
                                       "available": available,
                                       "gameswon": gamesWon ]
        
        dbRef.child("users").child(userKey!).setValue(userInfo)
        
    }

    
}// end class
