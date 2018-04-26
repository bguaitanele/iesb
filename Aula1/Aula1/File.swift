//
//  File.swift
//  Aula1
//
//  Created by HC2MAC13 on 19/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

//import Foundation
protocol Combustivel{
    func abastecer()
}
//classe veiculo
class Veiculo{
    
    
    var chassi: String!
    //construtor
    init(chassi :String){
        self.chassi = chassi
    }
    func acelerar(){
       //acelerando veiculo
    }
}

//classe moto
class Moto : Veiculo, Combustivel{
    
    //implementaçao da classe moto
    func abastecer() {
        print("Abastecendo uma moto com gasolina")
    }
    
}

//classe Carro
class Carro : Veiculo, Combustivel{
    
    override func acelerar() {
        print(" acelerando Carro")
        
        
    }
    func abastecer(){
        print("Abastecendo carro com álcool")
    }
    
    func engatarRe()  {
        print("Engatar Ré")
    }
    
    
}
//objeto carro e moto
var carro = Carro(chassi: "ssssss")
var moto = Moto(chassi: "wwwwww")


//funcao acelera com veiculo como paramentro
func acelerar(veiculo : Veiculo){
    veiculo.acelerar()
    
}
//funcao marchaRe passando veiculo como paramentro
func marchaRe(vei : Veiculo){
    if(vei is Carro){
        var carro = vei as! Carro
        carro.engatarRe()
    }else{
        print("Não é um Veiculo")
    }
    
}
func abastecer(com : Combustivel){
    com.abastecer()
}

//let  moto = abastecer(<#T##(com: Combustivel)#>)





