//
//  InvitationTableViewCell.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/15/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import UIKit

class InvitationTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var inviteButton: UIButton!
    
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
