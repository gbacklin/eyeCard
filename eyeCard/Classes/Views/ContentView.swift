//
//  ContentView.swift
//  eyeCard
//
//  Created by Gene Backlin on 8/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var index: Int = -1
    @State private var change: Bool = false
    @State private var answer: Int = 0
    
    let cardValues = [1, 8, 2, 16, 4, 32]
    
    var body: some View {
        VStack {
            Text("eyeCard")
                .font(.custom("Marker Felt", size: 25))
            if index < 0 {
                Text("Think of a number between 1 and 63")
                VStack {
                    Button(action: {
                        self.change.toggle()
                        self.answer = 0
                        self.index = 0
                    }) {
                        Text("Begin")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(70)
                            .foregroundColor(.white)
                            .padding(10)
                    }
                }
            } else if index < cardValues.count {
                if change {
                    FlipView(index: index)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
                        .animation(.default)
                } else {
                    FlipView(index: index)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
                        .animation(.default)
                }
                Spacer()
                VStack {
                    Text("Is your number on this card ?")
                        .font(.title)
                    HStack {
                        Button(action: {
                            self.change.toggle()
                            self.answer = self.answer +  self.cardValues[self.index]
                            self.index = self.index + 1
                        }) {
                            Text("Yes")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(70)
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        Button(action: {
                            self.change.toggle()
                            self.index = self.index + 1
                        }) {
                            Text(" No ")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(70)
                                .foregroundColor(.white)
                                .padding(10)
                        }
                    }
                }
            } else {
                Text("Your number is \(answer)")
                VStack {
                    Button(action: {
                        self.change.toggle()
                        self.answer = 0
                        self.index = -1
                    }) {
                        Text("Play Again")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(70)
                            .foregroundColor(.white)
                            .padding(10)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
