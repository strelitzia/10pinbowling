//
//  mainStoryBoardHelper.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit

class MainStoryBoardHelper {
    static func getAddUserView() -> AddUserTableViewController {
        let storyboard = getStoryboard()
        let addUserView = storyboard.instantiateViewController(withIdentifier: "AddUserTableViewControllerID")
        return addUserView as! AddUserTableViewController
    }
    
    
    static func getGameView() -> GameViewController {
        let storyboard = getStoryboard()
        let gameView = storyboard.instantiateViewController(withIdentifier: "GameViewControllerID")
        return gameView as! GameViewController
    }
    
//    static func getScoreView() -> ScoreCollectionViewController {
//        let storyboard = getStoryboard()
//        let scoreView = storyboard.instantiateViewController(withIdentifier: "ScoreCollectionViewControllerID")
//        return scoreView as! ScoreCollectionViewController
//    }
    
    fileprivate static func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
}

