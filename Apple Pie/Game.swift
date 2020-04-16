//
//  Game.swift
//  Apple Pie
//
//  Created by Ivan Prybolovetz on 4/16/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters : [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}
