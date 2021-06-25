//
//  ActionView.swift
//  Calculator
//
//  Created by Anvar Jumabaev on 07.06.21.
//

import Foundation
import SwiftUI

struct ActionView: View {
    enum Action {
        case equal, clear, plus, minus, multiply, divide
        
        func image() -> some View {
            switch self {
            case .equal:    return AnyView(Image(systemName: "equal"))
            case .clear:    return AnyView(Text("AC").font(.system(size: 35, weight: .bold, design: .monospaced)))
            case .plus:     return AnyView(Image(systemName: "plus"))
            case .minus:    return AnyView(Image(systemName: "minus"))
            case .multiply: return AnyView(Image(systemName: "multiply"))
            case .divide:   return AnyView(Image(systemName: "divide"))
            }
        }
        func calculate(_ input1: Double, _ input2: Double) -> Double? {
            switch self {
            case .plus:     return input1 + input2
            case .minus:    return input1 - input2
            case .multiply: return input1 * input2
            case .divide:   return input1 / input2
            default:        return nil
            }
        }
    }
    
    let action: Action
    
    @Binding var state: CalculationState
    
    var body: some View{
        action.image()
            .font(Font.title.weight(.bold))
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.green)
            .cornerRadius(12)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .onTapGesture {
                self.tapped()
            }

    }
    private func tapped(){
        switch action {
        case .clear:
            state.currentNum = 0
            state.storedNum = nil
            state.storedAction = nil
            break
        case .equal:
            guard let storedAction = state.storedAction else{ return }
            guard let storedNum = state.storedNum else{ return }
            guard let result = storedAction.calculate(storedNum, state.currentNum) else { return }
            state.currentNum = result
            state.storedNum = nil
            state.storedAction = nil
            break
        default:
            state.storedNum = state.currentNum
            state.currentNum = 0
            state.storedAction = action
            break
        }
    }
}
