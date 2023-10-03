//
//  ContentView.swift
//  Memorize
//
//  Created by Robert Lutz on 9/23/23.
//

import SwiftUI

struct CardView: View {
    var card: MemorizeGame<String>.Card
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
   
    let cardBase = RoundedRectangle(cornerRadius: 10)
    var body: some View {
        ZStack {
            cardBase.fill(.white)
            cardBase
                .strokeBorder(lineWidth: 2)
            Text(card.content)
                .aspectRatio(1, contentMode: .fit)
            cardBase.opacity(card.isFaceUp ? 0 : 1)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .font(.system(size: 200))
        .minimumScaleFactor(0.01)
//        .onTapGesture {viewModel.choose()}
    }
}


struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    var cards: some View {
        let themeColors: [Color] = [.orange, .green, .blue]
        print(viewModel.collectionIndex)
        return ScrollView {
            let numPairs = viewModel.cards.count / 2
            let minWidth = 205.0 / sqrt(Double(numPairs))
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minWidth), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards.indices, id: \.self) {index in CardView(viewModel.cards[index]).padding(4)}
            }
            .foregroundColor(themeColors[viewModel.collectionIndex])
        }
    }
    func makeButton(newIndex: Int, title: String, symbol: String) -> some View {
        Button(
            action: {
                viewModel.themeChooser(newIndex)
            },
            label: {
                VStack{
                    Image(systemName: symbol)
                    Text(title).font(.footnote)
                }
            }
        )
    }

    var buttons: some View {
        HStack{
            Spacer()
            makeButton(newIndex : 0, title: "halloween", symbol : "cloud.moon")
            Spacer()
            makeButton(newIndex : 1, title: "sports", symbol : "basketball")
            Spacer()
            makeButton(newIndex : 2, title: "medicine", symbol : "cross.case")
            Spacer()
        }

    }
    var body: some View {
        VStack {
            Text("Memorize!").bold()
            Spacer()
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
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame(collectionIndex: 0))
}
