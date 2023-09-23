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
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
                    .imageScale(.large)
            } else {cardBase}
        }
        .onTapGesture {isFaceUp .toggle()}
    }
}

struct ContentView: View {
    var body: some View {
        let cardFaces = ["👻", "💀", "🎃", "😈", "😱", "👹", "☠️", "👽"]
        HStack {
            ForEach(cardFaces, id: \.self) { face in CardView(content: face) }
        }
        .foregroundColor(.purple)
        .foregroundStyle(.tint)
        .padding()
    }
}

#Preview {
    ContentView()
}
