//
//  NumberView.swift
//  Calculator
//
//  Created by Anvar Jumabaev on 07.06.21.
//

import Foundation
import SwiftUI

struct NumberView: View{
    let number: Double
    @Binding var state: CalculationState
    var numberStr: String{
        if number == .pi{
            return "π"
        }
        return String(Int(number))
    }
    var body: some View{
        Text(numberStr)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.blue)
            .cornerRadius(12)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .onTapGesture {
                self.state.appendNumber(self.number)
            }
    }
}
