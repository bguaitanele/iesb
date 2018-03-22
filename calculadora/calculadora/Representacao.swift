//
//  TipoRepresentacao.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 19/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import Foundation

struct Representacao{
    
    public enum TipoRepresentacao {
        
        case unario( (Double) -> String)
        
    }
    
    public static var representacoes: [String: TipoRepresentacao ] = [
        
        "x²": TipoRepresentacao.unario({ String($0) + "²" }),
        "√": TipoRepresentacao.unario({ "sqrt(" + String($0) + ")" }),
        "Sen": TipoRepresentacao.unario({ "sen(" + String($0) + ")" }),
        "Cos": TipoRepresentacao.unario({ "cos(" + String($0) + ")" }),
        "Tan": TipoRepresentacao.unario({ "tan(" + String($0) + ")" }),
        "+": TipoRepresentacao.unario({ " + " + String($0) }),
        "-": TipoRepresentacao.unario({ " - " + String($0) }),
        "×": TipoRepresentacao.unario({ " × " + String($0) }),
        "÷": TipoRepresentacao.unario({ " ÷ " + String($0) }),
        "numero": TipoRepresentacao.unario({ String($0) }),
        
        //        "1/x" : Operacao.unario({ 1 / $0 }),
        //        "+": Operacao.binario({ $0 + $1 }),
        //        "-": Operacao.binario({ $0 - $1 }),
        //        "x": Operacao.binario({ $0 * $1 }),
        //        "/": Operacao.binario({ $0 / $1 }),
        //        "=": Operacao.igual,
        //        "Pow": Operacao.binario(pow),
        
        //        "X": Operacao.X
    ]
    
    
}
