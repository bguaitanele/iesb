//
//  Equacao.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 19/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import Foundation

struct Equacao {
    
    public var texto : String {
        
        get {
            var equacao = ""
            
            for item in arrEquacao{
                
                equacao = equacao + " " + item.representacaoTextual
                
            }
            
            return equacao
        }
    }
    
    private var arrEquacao: [ItemEquacao] = []
    
    mutating public func add( _ simbolo : String , _ operacao : Operacao.operacao , _ valor : Double? = 0 ){
        
        if let representacaoTextual = Representacao.representacoes[simbolo] {
            
            switch(representacaoTextual){
            case .unario(let funcao):
                arrEquacao.append( ItemEquacao(simbolo: simbolo, representacaoTextual: funcao( valor! ), funcao: operacao, valor: valor! ) )
            
            }
            
        }
        
    }
    
    mutating public func removeLast(){
        if(arrEquacao.count > 0 ){
            arrEquacao.removeLast()
        }
    }
    
    
    
    
    
    
    
}

struct ItemEquacao {
    
    var simbolo: String
    
    var representacaoTextual: String
    
    var funcao: Operacao.operacao
    
    var valor: Double? = 0
    
    
        
    
}
