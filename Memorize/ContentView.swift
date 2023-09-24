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
        .onTapGesture {isFaceUp.toggle()}
    }
}


struct ContentView: View {
    let cardFaceCollective = [
        ["👻", "💀", "🎃", "😈", "😱", "👹", "☠️", "👽"],
        ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏓", "🎳", "🥊", "🥌", "🏂"],
        ["😷", "🚑", "🏥", "🚒", "🩻", "⚕️", "💊"]
        ]
    let themeColors: [Color] = [.orange, .green, .blue]
    @State var index = 0
    func makeButton(newIndex : Int, title: String, symbol : String) -> some View {
        Button(
            action: {
                index = newIndex
            },
            label: {
                VStack{
                    Image(systemName: symbol)
                    Text(title).font(.footnote)
                }
            }
        )
    }
    var cards: some View {
        ScrollView {
            let faces = (cardFaceCollective[index] + cardFaceCollective[index]).shuffled()
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(0..<faces.count, id: \.self) {i in CardView(content: faces[i])}
            }
        }
        .foregroundColor(themeColors[index])
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
    ContentView()
}
