//
//  SetGame.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/17.
//

import Foundation

enum ThreeState<Value> where Value:Equatable { // three state with one type of value
    case first(Value)
    case second(Value)
    case third(Value)
}

// needs to represent 3-state of cards of combinations
// and match them accordingly
struct SetGame {
    
    var featureCount:Int = 4
    private(set) var board: [Card] // what's on the board
    private(set) var deck: [Card] // what's in the deck
    
    var canDeal: Bool {
        !deck.isEmpty
    }
    
    //back tracking
    private static func createCards(length:Int, full:Int, listing: [Int], deck: inout [Card]) {
        if length == full {
            // output a card
            var features: [TriState] = []
            for index in listing {
                features.append(TriState(index)!)
            }
            let card = Card(features: features)
            deck.append(card)
            return
        }
        
        for index in 0..<3 {
            var featureList = listing
            featureList.append(index)
            createCards(length: length+1, full: full, listing: featureList, deck: &deck)
        }
    }
    
    init(features: Int=4) {
        //first create cards
        deck = []
        
        //TODO: use backtracking to list all possible combinations
        
        SetGame.createCards(length: 0, full: features, listing: [], deck: &deck)
        // then draw 12 cards to board
        board = []
        for _ in 0..<12 {
            // choose 12 random elements to put on board
            let index = deck.indices.randomElement()!
            board.append(deck[index])
            deck.remove(at: index)
        }
        
    }
    
    mutating func match(_ cards: [Card]) { // choose one card
        //TODO: add game logic
        // if matched then remove, else
        if cards.count != 3 {
            return
        }
        
        
        if Card.isSet(cards[0], cards[1], cards[2]) {
            // then replace those cards with
        }
    }
    
    mutating func deal() { // deal 3 cards
        for _ in 0..<3 {
            if !deck.isEmpty {
                let index = deck.indices.randomElement()!
                board.append(deck[index])
                deck.remove(at: index)
            }
        }
    }
    
    
    
    struct Card :Identifiable {
        var id: Int {
            var result: Int = 0
            for feature in features {
                result = result * 10 + feature.valueIndex
            }
            return result
        }
        
        var features: Array<TriState>
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        static func isSet(_ first: Card,_ second:Card,_ third:Card) -> Bool {
            //TODO: add implementation
            return false
        }
        
        static func ==(lhs:Self, rhs:Self) {
            
        }
    }
}
