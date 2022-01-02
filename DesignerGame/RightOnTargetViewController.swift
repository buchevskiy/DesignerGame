//
//  RightOnTargetViewController.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 20.09.2021.
//

import UIKit

class RightOnTargetViewController: UIViewController {

    var game: Game<Int>!
    var generator: GeneratorProtocol!
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBAction func nextRoundButton(_ sender: Any) {
        let numberSlider = Int(self.slider.value.rounded())
        game.currentRound.calculateScore(playerValue: numberSlider)
        if !game.isGameEnded {
            game.startNewRound()
            updateLable(value: game.currentRound.secretValue)
        } else {
            showAlert()
            game.startNewGame()
            updateLable(value: game.currentRound.secretValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generator = Generator(startPoint: 0, endPoint: 50)
        game = Game(rounds: 5, generator: generator, color: nil)
        updateLable(value: game.currentRound.secretValue)
    }
    

    func showAlert() {
        let alert = UIAlertController(title: "The game is over", message: "Your score is: \(game.getScore())", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Start new game", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func updateLable(value: Int) {
        label.text = String(value)
    }

}
