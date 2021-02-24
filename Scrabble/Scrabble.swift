//
//  Scrabble.swift
//  Scrabble
//
//  Created by Felipe Díaz on 24/02/21.
//

import Foundation

class Scrabble {
    public private(set) var word:String?
    private var lastCalculatedScore:Int?
    
    var score:Int {
        get {
            if let score = lastCalculatedScore {
                return score
            }
            
            return calculateScore()
        }
    }
    
    init(_ word: String?) {
        self.word = word
    }
    
    public func setWord(_ newWord: String) {
        word = newWord
        lastCalculatedScore = nil
    }
    
    public func calculateScore() -> Int {
        guard let word = word?.uppercased() else { return 0 }

        var calculatedScore = 0
        
        for letter in word {
            switch letter {
            case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
                calculatedScore += 1
            case "D", "G":
                calculatedScore += 2
            case "B", "C", "M", "P":
                calculatedScore += 3
            case "F", "H", "V", "W", "Y":
                calculatedScore += 4
            case "K":
                calculatedScore += 5
            case "J", "X":
                calculatedScore += 8
            case "Q", "Z":
                calculatedScore += 10
            default:
                print("No points for \(letter)")
            }
        }
        
        lastCalculatedScore = calculatedScore
        return calculatedScore
    }
    
    public static func score(_ word: String) -> Int {
        return Scrabble(word).calculateScore()
    }
}

