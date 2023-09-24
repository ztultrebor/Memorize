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
            cardBase.fill(.white)
            cardBase
                .strokeBorder(lineWidth: 2)
            Text(content)
                .font(.largeTitle)
            cardBase.opacity(isFaceUp ? 0 : 1)
        }
        .aspectRatio(2/3, contentMode: .fit)
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
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                ForEach(0...1, id: \.self) {
                    _ in ForEach(0..<cardCount, id: \.self) {
                        i in CardView(content: cardFaces[i])
                    }
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

    }
    var body: some View {
        VStack {
            Text("Memorize!").foregroundColor(.purple).bold()
            cards
            Spacer()
            buttons
        }
        .foregroundStyle(.tint)
        .font(.largeTitle)
        .imageScale(.large)
        .padding()
    }
}




#Preview {
    ContentView()
}
