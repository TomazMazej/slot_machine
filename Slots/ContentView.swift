//
//  ContentView.swift
//  Slots
//
//  Created by Tomaz Mazej on 30/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    
    @State private var numbers = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

    @State private var backgrounds = [[Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white], [Color.white, Color.white, Color.white]]
    
    @State private var credits = 1000
    
    private var betAmount = 5
    
    var body: some View {
        
        ZStack{
            
            //Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 197/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
        
            VStack{
                
                Spacer()
                
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Mazej's Casino")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                    
                //Score counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()

                //Cards
                VStack{
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[0][0]], background: $backgrounds[0][0])
                        CardView(symbol: $symbols[numbers[0][1]], background: $backgrounds[0][1])
                        CardView(symbol: $symbols[numbers[0][2]], background: $backgrounds[0][2])
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[1][0]], background: $backgrounds[1][0])
                        CardView(symbol: $symbols[numbers[1][1]], background: $backgrounds[1][1])
                        CardView(symbol: $symbols[numbers[1][2]], background: $backgrounds[1][2])
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        CardView(symbol: $symbols[numbers[2][0]], background: $backgrounds[2][0])
                        CardView(symbol: $symbols[numbers[2][1]], background: $backgrounds[2][1])
                        CardView(symbol: $symbols[numbers[2][2]], background: $backgrounds[2][2])
                        Spacer()
                    }
                }
                Spacer()
                
                //Button
                Button(action: {
                    
                    //Set background back to white
                    for x in 0...backgrounds.count - 1{
                        for y in 0...backgrounds.count - 1{
                            backgrounds[x][y] = Color.white
                        }
                    }
                    
                    //Change the images
                    for x in 0...numbers.count - 1{
                        for y in 0...numbers.count - 1{
                            numbers[x][y] = Int.random(in: 0...self.symbols.count - 1)
                        }
                    }
                    
                    //Check winnings
                    if self.numbers[0][0] == self.numbers[0][1] && self.numbers[0][1] == self.numbers[0][2]{
                        //We won and we change color to green
                        self.credits += betAmount * 2
                        for x in 0...numbers.count - 1{
                                backgrounds[0][x] = Color.green
                        }
                    }
                    
                    else if self.numbers[1][0] == self.numbers[1][1] && self.numbers[1][1] == self.numbers[1][2]{
                        self.credits += betAmount * 2
                        for x in 0...numbers.count - 1{
                                backgrounds[1][x] = Color.green
                        }
                    }
                    
                    else if self.numbers[2][0] == self.numbers[2][1] && self.numbers[2][1] == self.numbers[2][2]{
                        self.credits += betAmount * 2
                        for x in 0...numbers.count - 1{
                                backgrounds[2][x] = Color.green
                        }
                    }
                    
                    else{
                        self.credits -= betAmount
                    }
                    
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
