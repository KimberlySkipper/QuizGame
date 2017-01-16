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
    

    static func createUserInFirebaseIfNotFound(username: String)
    {
        FIRDatabase.database().reference().child("users").queryOrderedByKey().observe(.value,  with: {(snapshot) -> Void in
            let allUsersDic = snapshot.value as! [String : Any]
            
            var foundUser: User?
            foundUser = nil
            for aUserKey in allUsersDic.keys
            {
                let aUserDic = allUsersDic[aUserKey] as! [String : Any]
                let aUserName = aUserDic["username"] as! String
                if AppState.sharedInstance.displayName == aUserName
                {
                    print("MATCHED \(aUserName)")
                    let name = aUserDic["name"] as? String ?? ""
                    let userName = aUserDic["username"] as? String ?? ""
                    let available = aUserDic["available"] as? Bool
                    let gamesWon = aUserDic["gameswon"] as? Int ?? 0
                    foundUser = User(name: name, userName: userName, available: available!, gamesWon: gamesWon)
                    foundUser?.userKey = aUserKey
                }else{
                    print("NOT MATCHED \(aUserName)")
                }
            }
            if foundUser == nil
            {
                let theOne = User(name: AppState.sharedInstance.displayName!, userName : AppState.sharedInstance.displayName!, available: true, gamesWon: 0)
                theOne.sendUserToFirebase()
            }else{
                
                print("we already have a user!(There is only one NEO)")
            }
        })
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
    // AppState.sharedInstance.displayName = user?.displayName
    
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
