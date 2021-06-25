//
//  CalculationState.swift
//  Calculator
//
//  Created by Anvar Jumabaev on 07.06.21.
//

import Foundation

struct CalculationState {
    var currentNum: Double = 0
    
    var storedNum: Double?
    var storedAction: ActionView.Action?
    
    mutating func appendNumber(_ num: Double) {
        if num.truncatingRemainder(dividingBy: 1) == 0 && currentNum.truncatingRemainder(dividingBy: 1) == 0{
            currentNum = 10 * currentNum + num
        }else{
            currentNum = num
        }
    }
}
