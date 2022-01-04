//
//  Game.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 27.09.2021.
//

import Foundation
import UIKit

protocol GameProtocol {
    associatedtype ValueType

    var generator: GeneratorProtocol? {get set}
    var numberOfRounds: Int {get set}
    var isGameEnded: Bool {get}

   
    func startNewRound()
    func startNewGame()
}

class Game<T>: GameProtocol {
    typealias ValueType = T

    var currentRound: GameRound<T>!
    var rounds: [GameRound<T>] = []
    
    var valueForLabel: String = ""
    

    var numberOfRounds: Int
    var generator: GeneratorProtocol? = nil
    var color: ColorProtocol? = nil
    
  

    var isGameEnded: Bool  {
        if numberOfRounds == rounds.count {
            return true
        } else {
            return false
        }
    }

    init?(rounds: Int, generator: GeneratorProtocol?, color: ColorProtocol?) {
        numberOfRounds = rounds
        if let generator = generator {
            self.generator = generator
        } else if let color = color {
            self.color = color
        }
        startNewRound()
    }


    func generateSecretValue() -> T? {
        var secretValue: T?
        if let generator = generator {
            secretValue = generator.getRandomValue() as? T
        } else if let color = color {
            secretValue = color.getUIColor() as? T
            valueForLabel = color.getValueForLabel()
        }
        return secretValue!
    }
    
    func startNewRound() {
        if let secretValue = self.generateSecretValue() {
            currentRound = GameRound(secretValue: secretValue)
            rounds.append(currentRound)
        }
    }
    func startNewGame() {
        rounds = []
        startNewRound()
    }
    
    func getScore() -> Int {
        var value = 0
        for round in rounds {
            value += round.score
        }
        return value
    }
}
