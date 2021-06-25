//
//  ContentView.swift
//  Calculator
//
//  Created by Anvar Jumabaev on 07.06.21.
//

import SwiftUI

struct ContentView: View {
    @State var state = CalculationState()
    
    var displayedNum: String{
        return String(format: "%.2f", arguments: [state.currentNum])
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .trailing){
                
                Spacer()
                
                ZStack(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                    Text(displayedNum)
                        .font(.system(size: 48, weight: .bold, design: .monospaced))
                        .padding()
                        .lineLimit(3)
                        .animation(.spring())
                }.padding(.horizontal)
                
                HStack{
                    FunctionView(function: .cosinus, state: $state)
                    Spacer()
                    FunctionView(function: .sinus, state: $state)
                    Spacer()
                    FunctionView(function: .tangens, state: $state)
                    Spacer()
                    ActionView(action: .multiply, state: $state)
                }.padding()
                
                HStack{
                    NumberView(number: 1, state: $state)
                    Spacer()
                    NumberView(number: 2, state: $state)
                    Spacer()
                    NumberView(number: 3, state: $state)
                    Spacer()
                    ActionView(action: .divide, state: $state)
                }.padding()
                
                HStack{
                    NumberView(number: 4, state: $state)
                    Spacer()
                    NumberView(number: 5, state: $state)
                    Spacer()
                    NumberView(number: 6, state: $state)
                    Spacer()
                    ActionView(action: .plus, state: $state)
                }.padding()
                
                HStack{
                    NumberView(number: 7, state: $state)
                    Spacer()
                    NumberView(number: 8, state: $state)
                    Spacer()
                    NumberView(number: 9, state: $state)
                    Spacer()
                    ActionView(action: .minus, state: $state)
                }.padding()
                
                HStack{
                    ActionView(action: .clear, state: $state)
                    Spacer()
                    NumberView(number: 0, state: $state)
                    Spacer()
                    NumberView(number: .pi, state: $state)
                    Spacer()
                    ActionView(action: .equal, state: $state)
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
