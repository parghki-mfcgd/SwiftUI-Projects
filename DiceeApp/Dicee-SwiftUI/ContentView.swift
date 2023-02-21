//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Kirti on 05/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ExtractedView()
        }
    }
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ExtractedView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    var body: some View {
        VStack {
            Image("diceeLogo")
            Spacer()
            HStack {
                DiceView(n: leftDiceNumber)
                DiceView(n: rightDiceNumber)
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                self.leftDiceNumber = Int.random(in: 1...6)
                self.rightDiceNumber = Int.random(in: 1...6)
            }) {
                Text("Roll")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .background(Color.red)
        }
    }
}
