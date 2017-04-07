//
//  GameViewController.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    var game:Game?
    var turn:Int = 0
    var hitablePinAmount: Int = 11 //(0..10)
    @IBOutlet weak var scoreView: UIScrollView!
    
    @IBAction func rolled(_ sender: Any) {
        let numberOfPinsHit = (getRandomNumberOutOf(number: hitablePinAmount))
       
        resultlabel.text = "\(numberOfPinsHit) out of \((hitablePinAmount-1))"
         hitablePinAmount -= numberOfPinsHit
        game!.addScore(score:numberOfPinsHit)
        refreshView()
    }

    @IBOutlet weak var resultlabel: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!

    func setGame(game:Game) {
        self.game = game
    }
    
    override func viewDidLoad() {
        
        refreshView()
        
    }
    
    public func getRandomNumberOutOf(number:Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func resetpins() {
        hitablePinAmount = 11
    }

    func refreshView() {
        rollButton.titleLabel?.text = "Roll"

        if game!.gameFinished() {
            rollButton.isUserInteractionEnabled = false
            

        } else {
            rollButton.isUserInteractionEnabled = true
            currentPlayerLabel.text = "player \(turn + 1): \(game!.player().name)"
            if game!.shouldResetPins() {
                resetpins()
                turn = game!.getTurn()
            }
        }
        addScoreToTheScoreBoard()
        
    }
    
    func addScoreToTheScoreBoard() {
//        for subview in scoreView.subviews {
//            subview.removeFromSuperview()
//        }
//        scoreView.isScrollEnabled = true
//
//        for player in game!.players {
//            let playerScoreBoard:UILabel = UILabel(frame: CGRect(x: 0, y: , width: scoreView.frame.size.width * 4, height: 100))
//            let points = player.score.getPoints()
//            var continuousScore:Int = 0
//            var text = "---- \(player.person.name) "
//            for frame in 1 ..< 10 {
//                continuousScore += points[frame-1].frameScore
//                text = "\(text) Frame : \(frame)  |  Result: \(points[frame-1].result)  |  Frame Score : \(points[frame-1].frameScore) | runningScore \(continuousScore):"
//            }
//            playerScoreBoard.text = text
//            scoreView.addSubview(playerScoreBoard)
//        }
    }
    
}
