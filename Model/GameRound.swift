//
//  GameRound.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 27.09.2021.
//

import Foundation
import UIKit

protocol GameRoundProtocol {
    associatedtype ValueType
    var secretValue: ValueType {get set}

    var score: Int {get set}
    
    func calculateScore(playerValue: ValueType)
}

class GameRound<T>: GameRoundProtocol {
    typealias ValueType = T
    
     
    var secretValue: T
 

    var score: Int
    
    init(secretValue: T) {
        score = 0
        self.secretValue = secretValue
    }
    
    func calculateScore(playerValue: T) {
        if let secretValue = secretValue as? Int, let playerValue = playerValue as? Int {
            if playerValue > secretValue {
                score = 50 - playerValue + secretValue
            } else if playerValue < secretValue {
                score = 50 - secretValue + playerValue
            } else {
                score = 50
            }
        } else if let secretValue = secretValue as? UIColor , let playerValue = playerValue as? UIColor {
            
            if secretValue == playerValue {
                score = 1
            }
        }
    }
}
