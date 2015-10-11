//
//  CustomTableViewCell.swift
//  SimpleContactsApplication
//
//  Created by Brendan Koning on 10/11/15.
//  Copyright © 2015 Brendan Koning. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNameAndEmail(name: String, email: String){
        self.nameLabel.text = name
        self.emailLabel.text = email
    }
    

}
