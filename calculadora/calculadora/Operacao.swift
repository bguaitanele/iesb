//
//  Operacao.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 19/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import Foundation

struct Operacao{
    
    public enum operacao {
        case constante(Double)
        case unario((Double) -> Double)
        case binario((Double,Double) -> Double)
        case igual
        case X
    }
      
    
    public static var operacoes: [String: operacao] = [
        "π": operacao.constante(Double.pi),
        "x²": operacao.unario({ $0*$0}),
        "±": operacao.unario({ -$0 }),
        "√": operacao.unario(sqrt),
        "numero": operacao.unario({$0}),
        "1/x" : operacao.unario({ 1 / $0 }),
        "+": operacao.binario({ $0 + $1 }),
        "-": operacao.binario({ $0 - $1 }),
        "×": operacao.binario({ $0 * $1 }),
        "÷": operacao.binario({ $0 / $1 }),
        "=": operacao.igual,
        "Pow": operacao.binario(pow),
        "Sen": operacao.unario(sin),
        "Cos": operacao.unario(cos),
        "Tan": operacao.unario(tan),
        "X": operacao.X
    ]
    
}
