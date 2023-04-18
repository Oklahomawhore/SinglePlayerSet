//
//  ContentView.swift
//  SinglePlayerSet
//
//  Created by Wangshu Zhu on 2023/4/17.
//

import SwiftUI


typealias Card  = SetGameViewModel.CardViewModel

struct SetGameView: View {
    @ObservedObject var game: SetGameViewModel
    @State var selectedCards: [Card] = []
    var body: some View {
        VStack {
            AspectVGrid<Card, CardView>(items: game.board, aspectRatio: 2/3) { card in
                CardView(card: card)
            }
            HStack {
                Button("New Game") {
                    game.newGame()
                }.padding(8)
                Spacer()
                Button("Deal Cards") {
                    game.deal()
                }.padding(8)
                
            }
        }
    }
}


// feature 1 : number
// feature 2 : 

struct CardView: View {
    typealias Card  = SetGameViewModel.CardViewModel
    var card: Card
    var body: some View  {
        if !card.isMatched {
            
            ZStack {
                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius).stroke(lineWidth: DrawingConstants.lineWidth)
                VStack  {
                    // this should be fixed size
                    
                    ForEach(0..<card.number, id:\.self, content: { _ in
                        switch card.symbol {
                        case .first:
                            switch card.shading {
                            case .first:
                                DiamondShape().stroke()
                            case .second:
                                //TODO: implement striped shading
                                DiamondShape().fill(.linearGradient(colors: [getColor(), .white], startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 1.0, y: 1.0)))
                            case .third:
                                DiamondShape().fill()
                            }
                            
                        case .second:
                            switch card.shading {
                            case .first:
                                SwiggleShape().stroke()
                            case .second:
                                //TODO: implement striped shading
                                SwiggleShape().fill(.linearGradient(colors: [getColor(), .white], startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 1.0, y: 1.0)))
                            case .third:
                                SwiggleShape().fill()
                            }
                        case .third:
                            
                            switch card.shading {
                            case .first:
                                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius).stroke()
                            case .second:
                                //TODO: implement striped shading
                                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius).fill(.linearGradient(colors: [getColor(), .white], startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 1.0, y: 1.0)))
                            case .third:
                                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius).fill()
                            }
                        }
                    }).padding(1)
                }
                .padding(4)
                .foregroundColor(getColor())
            }.padding(4)
        }
    }
    
    
    private func getColor() -> Color {
        switch card.color {
        case .first(let color):
            return color
        case .second(let color):
            return color
        case .third(let color):
            return color
        }
    }
        
    private struct DrawingConstants {
        static let cornerRadius:CGFloat = 5.0
        static let lineWidth: CGFloat = 1.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}
