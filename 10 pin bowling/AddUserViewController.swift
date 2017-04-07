//
//  AddUserViewController.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit

protocol AddUserCellEventHandler {
    func addTapped(name:String)
}

class AddUserTableViewController: UITableViewController, AddUserCellEventHandler {
    
    var userList: [Person]

    @IBOutlet weak var startPlayToolbar: UIToolbar!
    public var presenter: UserViewPresenter?
    
    func addUser(name:String) {
        userList.append(Person(name: name))
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == userList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddUserTableViewCellID") as! AddUserTableViewCell
            cell.eventhander = self
            cell.clearText()
            return cell
        } else if indexPath.row < userList.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCellID") as! UserTableViewCell
            cell.setPerson(person: userList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userList.count+1
        } else {
            return 0
        }
    }

    required init?(coder aDecoder: NSCoder) {
        userList = [Person]()
        super.init(coder:aDecoder)
        
    }
    @IBAction func StartPlayingTapped(_ sender: Any) {
        presenter?.startPlayingTapped(playerlist: userList)
    }
    
    override func viewDidLoad() {
        startPlayToolbar.isHidden = true
    }
    func addTapped(name: String) {
        self.addUser(name: name)
        startPlayToolbar.isHidden = false
    }

}
