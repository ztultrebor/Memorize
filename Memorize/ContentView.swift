//
//  ContentView.swift
//  Memorize
//
//  Created by Robert Lutz on 9/23/23.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp = false
    let cardBase = RoundedRectangle(cornerRadius: 10)
    var body: some View {
        ZStack {
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text("!👻!")
                    .font(.largeTitle)
                    .imageScale(.large)
            } else {cardBase}
        }
        .onTapGesture {isFaceUp .toggle()}
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
            .foregroundColor(.purple)
            .foregroundStyle(.tint)
            .padding()
    }
}

#Preview {
    ContentView()
}
