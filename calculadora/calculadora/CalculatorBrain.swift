//
//  CalculatorBrain.swift
//  calculadora
//
//  Created by HC5MAC10 on 29/11/17.
//  Copyright © 2017 IESB. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var result : Double? {
        get {
            return accumulator
        }
    }
    var accumulator : Double?
    
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double,Double) -> Double)
        case equals
    }
    
    private var operations : Dictionary<String, Operation> = [
        
        "e" : Operation.constant(M_E),
        "√" : Operation.unary(sqrt),
        "+" : Operation.binary({ $0 + $1 }),
        "x" : Operation.binary({ $0 * $1 }),
        "÷" : Operation.binary({ $0 / $1 }),
        "-" : Operation.binary({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    mutating func setOperand( _ operand : Double ){
        accumulator = operand
    }
    
    mutating func performOperation( _mathSymbol : String ){
        if let operation = operations[_mathSymbol]{
            switch operation {
            case .constant(let constant):
                accumulator = constant
            case .unary(let function):
                
                if accumulator != nil {
                    accumulator  = function(accumulator!)
                }
            case .binary(let function):
                if( accumulator != nil ){
                    pbo = PendingBinaryOperation(firstOperand: accumulator!, function: function )
                }
                break
            case .equals:
                performPendindBinaryOperation()
                break;
            }
        }
    }

    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let firstOperand : Double
        let function: (Double,Double) -> Double
        
        func perform(with secondOperand : Double) -> Double{
            return function(firstOperand,secondOperand)
        }
    }
    
    private mutating func performPendindBinaryOperation(){
        if accumulator != nil {
            accumulator = pbo?.perform(with: accumulator!)
        }
    }
    
    
}


