//
//  AddUserTableViewCell.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit

class AddUserTableViewCell: UITableViewCell {
   
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    
    public var eventhander:AddUserCellEventHandler? = nil
  
    @IBAction func addTapped(_ sender: Any) {
        if let eventhander = eventhander, let name = nameTextfield.text {
            eventhander.addTapped(name: name)
        }
    }
    
    public func clearText() {
        nameTextfield.text = ""

    }

    
    
    
}
