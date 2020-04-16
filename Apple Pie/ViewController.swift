//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ivan Prybolovetz on 4/14/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - ... IBOutlet
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - ... Properties
    var currentGame: Game!
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    var listOfWords = ["арбуз",
                       "гном",
                       "болт"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        letters[0] = letters[0].capitalized
        let wordWithSpacing = letters.joined(separator: " ")
        
        //обновление картинки
        let imageName = "Tree \(currentGame.incorrectMovesRemaining)"
        let image = UIImage(named: imageName)
        
        //обновление угадываемое слово
        correctLabel.text = wordWithSpacing
        
         //обновление счета
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
        treeImageView.image = image
    }
    
    
    // MARK: - ... IBAction
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
}

