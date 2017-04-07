//
//  Game.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation

class Game {
    var round: Int
    var players:[(person: Person, score:Score)]
    var turn: Int
    
    var _shouldResetPins:Bool
    
    var currenPlayerScore: (first:Int?, second:Int?)
    
    init(players:[Person]) {
        round = 0
        turn = 0
        _shouldResetPins = true
        self.players = []
        
        
        for player in players {
            self.players.append((person: player, score: Score()))
        }
        currenPlayerScore = (first:nil,second:nil)
    }
    
    public func addScore(score:Int) {
        if currenPlayerScore.first == nil {
            addFirstScore(firstScore: score)
        } else if currenPlayerScore.second == nil {
            addSecondScore(secondScore: score)
        }
    }
    
    func player() -> Person {
        return players[turn].person
    }
    
    private func addFirstScore(firstScore:Int) {
        currenPlayerScore.first = firstScore
        _shouldResetPins = false
        if firstScore == 10 {
            addSecondScore(secondScore: 0)
        }
        
    }
    
    private func addSecondScore(secondScore:Int) {
        currenPlayerScore.second = secondScore
        turnDone()
    }
    
    func turnDone() {
        players[turn].score.addScore(first: currenPlayerScore.first!, second: currenPlayerScore.second!)
        _shouldResetPins = true
        turn += 1
        if turn == players.count {
            turn = 0
            round += 1
        }
        
        currenPlayerScore = (first:nil,second:nil)
    }
    public func getTurn() -> Int {
        return turn
    }
    public func gameFinished() -> Bool {
        return round == 10
    }
    
    public func shouldResetPins() -> Bool {
        return _shouldResetPins;
    }
    
    
}
