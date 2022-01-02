//
//  SelectorColorViewContoller.swift
//  DesignerGame
//
//  Created by Андрей Бучевский on 20.09.2021.
//

import UIKit

class SelectorColorViewContoller: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var game: Game<UIColor>!
    var buttons: [UIButton] = []
    var color: Color!
    var generator: GeneratorProtocol!
    
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var firstRectangle: UIButton!
    
    @IBOutlet var secondRectangle: UIButton!

    @IBOutlet var thirdRectangle: UIButton!
    
    @IBOutlet var fourthRectangle: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttons.append(firstRectangle)
        buttons.append(secondRectangle)
        buttons.append(thirdRectangle)
        buttons.append(fourthRectangle)
        generator = Generator(startPoint: 0, endPoint: 255)
        color = Color(generator: generator)
        game = Game(rounds: 5, generator: nil, color: color)
        setColors()
    }
    
    
    
    func setColors() {
        buttons.shuffle()
        buttons[0].backgroundColor = game.currentRound.secretValue
        buttons[1].backgroundColor = color.getUIColor()
        buttons[2].backgroundColor = color.getUIColor()
        buttons[3].backgroundColor = color.getUIColor()
        updateLabel(game.valueForLabel)
        
    }
    
    @IBAction func checkRectangle(_ sender: UIButton) {
        game.currentRound.calculateScore(playerValue: sender.backgroundColor!)
        if !game.isGameEnded {
            game.startNewRound()
            setColors()
        } else {
            showAlert()
            game.startNewGame()
            setColors()
        }
    }
    func updateLabel(_ hexValue: String) {
        label.text = hexValue
    }
    func showAlert() {
        let alert = UIAlertController(title: "The game is over", message: "Your score is: \(game.getScore())", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Start new game", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
