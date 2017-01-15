//
//  LogInViewController.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/12/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
  
class LogInViewController: UIViewController, GIDSignInUIDelegate
{
       
    
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //use the code below if you want to sign in automatically.
        //GIDSignIn.sharedInstance().signIn()
        
        googleSignInButton.style = GIDSignInButtonStyle.standard
        googleSignInButton.colorScheme = GIDSignInButtonColorScheme.light
        
        title = "Sign In"
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func goToInvitationPage (_ sender: GIDSignInButton!)
//    {
//        performSegue(withIdentifier: "ShowInvitationSegue", sender: self)
//    }
       

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier = "ShowInviteSegue"
//        {
//            let destinationVC = segue.destination as! InvitationViewController
//        }
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }


}// end class
