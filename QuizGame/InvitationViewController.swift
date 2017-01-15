//
//  InvitationsViewController.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/13/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class InvitationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!

    var listOfUsers = [User]()
    var dbRef: FIRDatabaseReference!
    var refHandle: FIRDatabaseHandle!


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "The Rogue List"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Firebase methods
    
    deinit
    {
        self.dbRef.child("users").removeObserver(withHandle: refHandle)
    }
    
    func configureDatabase()
    {
        dbRef = FIRDatabase.database().reference()
        refHandle = dbRef.child("users").observe(.childAdded, with: {(snapshot) -> Void in
            let gameUser = User.createUserFromJsonDictionary(snapshot.value as! [String : Any])
            gameUser?.userKey = snapshot.key
            self.listOfUsers.append(gameUser!)
            let indexPath = IndexPath(row: self.listOfUsers.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listOfUsers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InviteUserCell", for: indexPath) as! InvitationTableViewCell
        let aUser = listOfUsers[indexPath.row]
        
        let userName = aUser.userName
        
        cell.userNameLabel.text = ("\(userName)")
        return cell

    }
    
    @IBAction func logOut(_ sender: UIBarButtonItem)
  {
    GIDSignIn.sharedInstance().signOut()
    AppState.sharedInstance.signedIn = false
    let firebaseAuth = FIRAuth.auth()
    do {
        try firebaseAuth?.signOut()
        print ("user is signed out")
    } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
    }
    self.navigationController?.popViewController(animated: true)
   }

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
