//
//  Score.swift
//  10 pin bowling
//
//  Created by Maret Stoffberg on 2017/04/07.
//  Copyright © 2017 Maret Stoffberg. All rights reserved.
//

import Foundation
class Score {
    //for one player
    var scores: [(first:Int,second:Int)]
    
    init() {
        scores = []
    }
    
    public func addScore(first:Int,second:Int) {
        scores.append((first: first,second:second))
    }
    
    public func getPoints() -> [(result:String , frameScore:Int)] {
        var points: [(result:String , frameScore:Int)] = []
        for _ in 0 ..< 10 {
            let  point = (result:"" , frameScore:0)
            points.append(point)
        }
        
        var index = -1
        for score in scores {
            index += 1
            
            if isStrike(score:score) {
                points[index].result = "X"
                points[index].frameScore += 10
                if scores.count < index + 1 {
                    let firstRoll = scores[index + 1].first
                    let secondRoll:Int
                    if firstRoll == 10 {
                        if scores.count < index + 2 {
                            secondRoll = scores[index + 2].first
                        } else {
                            secondRoll = 0
                        }
                    } else {
                        secondRoll = scores[index + 1].second
                    }
                    points[index].frameScore += (firstRoll + secondRoll)
                }
                
                
            } else if isSpare(score: score) {
                points[index].result = "\(score.first) /"
                points[index].frameScore += 10
                if scores.count < index + 1 {
                    points[index].frameScore += (scores[index + 1].first)
                }
                
            } else {
                points[index].result = "\(score.first) \(score.second)"
                points[index].frameScore += score.first + score.second
                
            }
        }
        
        return points
        
        
    }
    
    private func isStrike(score:(first:Int,second:Int)) -> Bool {
        return score.first == 10
    }
    
    private func isSpare(score:(first:Int,second:Int)) -> Bool {
        return (score.first + score.second) == 10
    }
    
    public func totalScore() -> Int {
        let points = getPoints()
        var total = 0;
        for point in points {
            total += point.frameScore
        }
        
        return total
    }
}
