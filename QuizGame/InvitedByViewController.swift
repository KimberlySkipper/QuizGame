//
//  InvitedByViewController.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/16/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import UIKit
import Firebase

class InvitedByViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProperNerdAPIManagerProtocol
{
    
    @IBOutlet weak var tableView: UITableView!

    
    var api: ProperNerdAPIManager!
    var turn = [GameRound].self
    
    var listOfInvitations = [Invitation]()
    var dbRef: FIRDatabaseReference!
    var refHandle: FIRDatabaseHandle!


    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Who Invited Who"
        configureDatabase()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    
        return listOfInvitations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhoInvitedYouCell",
            for: indexPath) as! InvitedByTableViewCell
        let anInvitation = listOfInvitations[indexPath.row]

        cell.playerInvitedNameLabel.text = ("\(anInvitation.receiver)")
        
        return cell
        
    }
    
    //MARK: - Firebase Mathods
    
//    deinit
//    {
//        self.dbRef.child("invitations").removeObserver(withHandle: refHandle)
//    }
    
    func configureDatabase()
    {
        dbRef = FIRDatabase.database().reference()
        refHandle = dbRef.child("invitations").observe(.childAdded, with: {(snapshot) -> Void in
            let anInvite = Invitation.createInvitationFromJsonDictionary(snapshot.value as! [String : Any])
            anInvite?.inviteKey = snapshot.key
            self.listOfInvitations.append(anInvite!)
            //            let indexPath = IndexPath(row: self.listOfUsers.count - 1, section: 0)
            //            self.tableView.insertRows(at: [indexPath], with: .automatic)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: self.listOfInvitations.count-1, section: 0)], with: .automatic)
            self.tableView.endUpdates()
            //self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            
        })
        
    }
    
    //MARK: conforming to delegate
    func didReceiveStarWarsQA(StarWarsQAInfo: [GameRound])
    {
        
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}// end class




