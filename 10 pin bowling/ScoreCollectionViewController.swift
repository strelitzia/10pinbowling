//
//  ScoreTableViewController.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit
class ScoreCollectionViewController : UICollectionViewController {
    private var game:Game?
    
    func updateGame(game:Game) {
        self.game = game
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return game!.players.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            
        }
        
        return UICollectionViewCell()
    }
    
}
