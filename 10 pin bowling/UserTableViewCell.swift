//
//  UserTableViewCell.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
    var  person:Person? = nil
    @IBOutlet weak var nameLabel: UILabel!
    
    public func setPerson(person:Person) {
        self.person = person
        nameLabel.text = person.name
    }
}
