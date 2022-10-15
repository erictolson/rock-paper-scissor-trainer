//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Eric Tolson on 9/17/22.
//

import SwiftUI

struct ContentView: View {
    private let possibleMoves = ["Rock", "Paper", "Scissors"]
    private let winningMoves = ["Paper", "Scissors", "Rock"]
    private let losingMoves = ["Scissors", "Rock", "Paper"]
    
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var winOrLose = Bool.random()
    @State private var userScore = 0
    @State private var overMessage = "Game over!"
    @State private var gameOver = false
    @State private var userTurn = 1
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                Spacer()

                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(radius: 10)
           
                VStack {
                    
                Text("Computer plays:")
                    .font(.title)
                    .foregroundColor(.white)
                    
                Text(possibleMoves[computerChoice])
                        .font(.title.weight(.bold))
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                if winOrLose {Text("Play the right move to win!") .font(.title) .foregroundColor(.white)}
                else {Text("Play the right move to lose!") .font(.title) .foregroundColor(.white)}
            
                    ForEach(0..<3) { number in
                        Button {
                            optionTapped(number)
                        } label: {
                            if winOrLose {Text(winningMoves[number])}
                            else {Text(losingMoves[number])}
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                        .font(.title.weight(.bold))
                        .shadow(radius: 5)
                        
                    }

                }
                .padding()
                Spacer()

                VStack {
                    Text("Player Score: \(userScore)")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Player turn: \(userTurn)/10")
                        .font(.title)
                        .foregroundColor(.white)
                }
              
                Spacer()
                Spacer()
                Spacer()


            }
        

        }
        .alert("Game over. You scored \(userScore) points.", isPresented: $gameOver) {
            Button("Play again?", action: reset)
    }
            
            
}
    
    func optionTapped(_ number: Int) {
        if number == computerChoice {
            userScore += 1
        }
        
        userTurn += 1
        
        if userTurn == 11 {
            userTurn = 10
            gameOver = true
        }
        
        computerChoice = Int.random(in: 0...2)
        winOrLose = Bool.random()
        
        
    }
    
    func reset() {
        userScore = 0
        userTurn = 1
        computerChoice = Int.random(in: 0...2)
        winOrLose = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
