//
//  Game.swift
//  Apple Pie
//
//  Created by Ivan Prybolovetz on 4/16/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import Foundation

struct Game {
    //угадываемое слово
    var word: String
    //кол оставшихся попыток
    var incorrectMovesRemaining: Int
    //список нажатых букв
    var guessedLetters : [Character]
    
    
    //отоброжаемое слово
    var formattedWord: String {
        get {
            var guessedWord = ""
            
            for letter in word {
                if guessedLetters.contains(letter) {
                    guessedWord += "\(letter)"
                } else {
                    guessedWord += "_"
                }
            }
            return guessedWord
        }
        set {
            for letter in newValue {
                playerGuessed(letter: letter)
            }
        }
    }
    
    
    //обработка нажатой буквы
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        //проверка,содержится ли буква в слове
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
