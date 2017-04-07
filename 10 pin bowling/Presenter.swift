//
//  Presenter.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit
class Person {
    var name: String
    
    init(name:String) {
        self.name  = name
    }
}



protocol UserViewPresenter {
    func startPlayingTapped(playerlist:[Person])
}

class Presenter: UserViewPresenter {
    let addUserView: AddUserTableViewController
    let gameView: GameViewController
    let navController: UINavigationController
    
    init(window: UIWindow) {
        addUserView = MainStoryBoardHelper.getAddUserView()
        gameView = MainStoryBoardHelper.getGameView()
        navController = UINavigationController(rootViewController: addUserView)
        addUserView.presenter = self
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
    }
    
    func startPlayingTapped(playerlist:[Person]) {
        gameView.setGame(game: Game(players:playerlist))
        navController.pushViewController(gameView, animated: true)
    }

}
