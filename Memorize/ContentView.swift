//
//  ContentView.swift
//  Memorize
//
//  Created by Robert Lutz on 9/23/23.
//

import SwiftUI

struct CardView: View {
    var isFaceUp = true
    let cardBase = RoundedRectangle(cornerRadius: 20.0)
    var body: some View {
        if isFaceUp {
            ZStack {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text("!👻!")
                    .font(.largeTitle)
                    .imageScale(.large)
            }
        } else {cardBase}
    }
}

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp: false)
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
