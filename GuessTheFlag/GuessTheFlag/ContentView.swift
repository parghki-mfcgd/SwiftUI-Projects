//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kirti Parghi on 2023-02-26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userScore = 0
    @State private var questionCounter = 0
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correntAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            
            //LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
                
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correntAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            //flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("Final Score", isPresented: $showingFinalScore) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your final score is \(userScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        questionCounter += 1
        if number == correntAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's is the flag of \(countries[number])"
            userScore -= 1
        }
        if questionCounter >= 8 { //Show final alert and reset everything
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correntAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries = countries.shuffled()
        correntAnswer = Int.random(in: 0...2)
        questionCounter = 0
        userScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
