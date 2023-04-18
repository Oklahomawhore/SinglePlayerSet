//
//  SetGameViewModel.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/17.
//

import Foundation
import SwiftUI

enum Shading {
    case none
    case solid
    case stripe
}

enum SymbolShape {
    case diamond
    case solid
    case striped
}

class SetGameViewModel :ObservableObject {
    // to translate from model features to view features
    @Published private var game: SetGame = createGame()
    
    static let color = 0, number = 1, shading = 2, shaping = 3
    static var colors:[Color] = [.red, .green, .blue]
    static let numbers:[Int] = [1,2,3]
    static let shadings:[String] = ["none", "solid", "striped"]
    static let shapes: [String] = ["diamond","swiggle","rectangle"]
    
    
    
    
    var deck:[CardViewModel] {
        game.deck.map { gameCard in
            SetGameViewModel.convertModel(gameCard)
        }
    }
    var board:[CardViewModel] {
        game.board.map { gameCard in
            SetGameViewModel.convertModel(gameCard)
        }
    }
    
    static func convertModel(_ card: SetGame.Card) -> CardViewModel {
        let features:[TriState] = card.features
        let numberFeature = SetGameViewModel.numbers[features[SetGameViewModel.number].valueIndex]
        
        
        return CardViewModel(
            color: Trig<Color>(from: features[SetGameViewModel.color].valueIndex, elements: SetGameViewModel.colors),
            number: numberFeature,
            shading: Trig<String>(from: features[SetGameViewModel.shading].valueIndex, elements: SetGameViewModel.shadings),
            symbol: Trig<String>(from: features[SetGameViewModel.shaping].valueIndex, elements: SetGameViewModel.shapes),
            card: card,
            isFaceUp: card.isFaceUp,
            isMatched: card.isMatched
        )
    }
    
    
    
    static func createGame() -> SetGame {
        let setGame =  SetGame(features: 4)
        return setGame
    }
    
    
    // MARK: - Intents
    // game logic is indifferent to which cards are selected!
    func match(cards: [SetGame.Card]) {
        game.match(cards)
    }
    
    func deal() {
        game.deal()
    }
    
    func newGame() {
        game = SetGameViewModel.createGame()
    }
    
    struct CardViewModel: Identifiable {
        var id: Int {
            card.id
        }
        
        
        let color: Trig<Color>
        let number: Int
        let shading: Trig<String>
        let symbol: Trig<String>
        let card: SetGame.Card
        
        var isFaceUp:Bool
        var isMatched:Bool
    }
}


