//
//  ContentView.swift
//  Memorize
//
//  Created by Robert Lutz on 9/23/23.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    let cardBase = RoundedRectangle(cornerRadius: 10)
    var body: some View {
        ZStack {
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
                    .imageScale(.large)
            } else {cardBase}
        }
        .foregroundColor(.purple)
        .onTapGesture {isFaceUp.toggle()}
    }
}


struct ContentView: View {
    let cardFaces = ["👻", "💀", "🎃", "😈", "😱", "👹", "☠️", "👽"]
    @State var cardCount = 2
    func makeButton(by increment : Int, symbol : String) -> some View {
        Button(
            action: {
                cardCount += increment
            },
            label: {
                Image(systemName: "rectangle.stack.badge.\(symbol)")
            }
        )
        .disabled(cardCount + increment < 1 || cardCount + increment > cardFaces.count)
    }
    var cards: some View {
        HStack {
            ForEach(0...1, id: \.self) {
                _ in ForEach(0..<cardCount, id: \.self) {
                    i in CardView(content: cardFaces[i])
                }
            }
        }
    }
    var buttons: some View {
        HStack{
            makeButton(by : -1, symbol : "minus")
            Spacer()
            makeButton(by : +1, symbol : "plus")
        }
        .font(.largeTitle)
        .imageScale(.large)
    }
    var body: some View {
        VStack {
            cards
            buttons
        }
        .foregroundStyle(.tint)
        .padding()
    }
}




#Preview {
    ContentView()
}
