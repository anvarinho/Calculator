//
//  FunctionView.swift
//  Calculator
//
//  Created by Anvar Jumabaev on 07.06.21.
//

import Foundation
import SwiftUI

struct FunctionView: View {
    
    enum MathFunction{
        case sinus, cosinus, tangens
        
        func string() -> String {
            switch self{
            case .sinus:    return "sin"
            case .cosinus:  return "cos"
            case .tangens:  return "tan"
            }
        }
        
        func operation(_ input: Double) -> Double {
            switch self {
            case .sinus:    return sin(input)
            case .cosinus:  return cos(input)
            case .tangens:  return tan(input)
            }
        }
    }
    
    var function: MathFunction
    
    @Binding var state: CalculationState
    
    var body: some View{
        Text(function.string())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(width: 64, height: 64)
            .background(Color.gray)
            .cornerRadius(12)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .onTapGesture {
                self.state.currentNum = self.function.operation(self.state.currentNum)
            }
        
    }
}
