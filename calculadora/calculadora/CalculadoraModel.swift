//
//  CalculadoraModel.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 30/11/17.
//  Copyright © 2017 Bruno De Castro Guaitanele. All rights reserved.
//

import Foundation

struct CalculadoraModel {
    
    private var resultado : Double = 0
    
    private var substituicaoValor = false
    
    private var calculoBinarioPendente : CalculoBinario?
    
    public var equacao = Equacao()
    
    private var ultimoSimbolo = "+"
    
    
    /*
     O resultado
     */
    mutating func calcular( _ valor:Double, _ simbolo : String, _ isNovoValor : Bool ) -> Double{
        
        if let operacao = Operacao.operacoes[simbolo]{
            
            switch(operacao){
            case .constante(let constante):
                substituicaoValor = true
                equacao.add( simbolo, operacao )
                return constante
            case .unario(let funcao):
                substituicaoValor = true
                equacao.add( simbolo, operacao , valor)
                return funcao(valor)
            case .binario(let funcao):
                if(calculoBinarioPendente != nil ){
                    if isNovoValor || ( !isNovoValor && substituicaoValor == true ) {
                        resultado = calculoBinarioPendente!.calcular(valor)
                        equacao.add( calculoBinarioPendente!.simbolo! , operacao , valor)
                        
                    }else{
                        calculoBinarioPendente!.funcao = funcao
                        calculoBinarioPendente!.simbolo = simbolo
                        
                    }
                }else{
                    resultado = valor
                    if(isNovoValor){
                        equacao.add( "numero" , Operacao.operacoes["numero"]! , valor )
                    }
                }
                
                calculoBinarioPendente = CalculoBinario(valor: resultado, funcao: funcao, simbolo: simbolo)
                substituicaoValor = false
                return resultado
                
                
            case .igual:
                if calculoBinarioPendente != nil {
                    resultado = calculoBinarioPendente!.calcular(valor)
                    return resultado
                }
                break;
                
            case .X:
                break;
            }
            
            
            
            
        }

        return resultado
        
        
    }

    
    mutating func zerar(){
        resultado = 0
        substituicaoValor = false
        calculoBinarioPendente = nil
        equacao = Equacao()
        
    }
    
   
}

struct CalculoBinario{
    let valor:Double
    var funcao : (Double,Double)->Double
    var simbolo: String?
    
    func calcular( _ segundoValor : Double ) -> Double{
        return funcao(valor,segundoValor)
    }
    
    
}
