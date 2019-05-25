//
//  ViewController.swift
//  Concentration
//
//  Created by Alexander Nevarko on 20/04/2019.
//  Copyright © 2019 Alexander Nevarko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
        
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Score: \(flipCount)"
        }
    }
    
    @IBAction private func newGameController(_ sender: UIButton) {
        emojiChoices = ["👻", "🎃", "😫", "🖕🏾", "🧠", "🐢", "❄️", "🌟"]
        flipCount = 0
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var emojiChoices = ["👻", "🎃", "😫", "🖕🏾", "🧠", "🐢", "❄️", "🌟"]
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card not in the cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.4767403007, blue: 0, alpha: 0) : #colorLiteral(red: 0.3789638877, green: 0.08132829517, blue: 0.3843497038, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

