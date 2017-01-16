//
//  InvitedByTableViewCell.swift
//  QuizGame
//
//  Created by Kimberly Skipper on 1/13/17.
//  Copyright © 2017 The Iron Yard. All rights reserved.
//

import UIKit

class InvitedByTableViewCell: UITableViewCell
{
    @IBOutlet weak var playerInvitedNameLabel: UILabel!
       
    @IBOutlet weak var acceptGameButton: UIButton!
    @IBOutlet weak var denyGameButton: UIButton!

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
