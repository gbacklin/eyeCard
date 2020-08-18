//
//  FlipView.swift
//  eyeCard
//
//  Created by Gene Backlin on 8/17/20.
//

import SwiftUI

let cardNames = ["0", "1", "2", "3", "4", "5"]

struct FlipView: View {
    var index: Int
    var body: some View {
        ZStack {
            Image(cardNames[index])
                .resizable()
                .scaledToFit()
            Spacer()
        }
    }
}

struct FlipView_Previews: PreviewProvider {
    static var previews: some View {
        FlipView(index: 0)
    }
}
