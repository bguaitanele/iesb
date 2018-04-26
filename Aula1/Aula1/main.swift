//
//  main.swift
//  Aula1
//
//  Created by HC2MAC13 on 12/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import Foundation

//var nome : Any = "Adriano"
//let sobrenome = "Baltazar" //contante
//print(nome as! Double) erro
//print(nome as? Double) nill
//if (nome is String){
//    print("\(nome) é uma String")
//}
//var nome : String? = "João"
//nome = nil
//var nome : String? = "João"
//nome = nil
//print("Seu nome: \(nome) possui \(nome.count) caracteres")
//print("Seu nome: \(nome) possui \(nome?.count) caracteres")
//if (nome != nil){
 //       print("Seu nome: \(nome) possui \(nome!.count) caracteres")
//}
//let result = nome != nil ? "Não é Nil" : "É Nil"
//var texto : String? = nil
//let resumo = texto ?? "Olá mundo"
//print("\(resumo)  \(result)")

//func somar(n1 : Int, n2 : Int) -> Int {
//   return n1 + n2
//}
//let result = somar(n1: 10, n2: 20)
//print (result)
//func imprimir (texto : String){
//    print(texto)
//}
//imprimir(texto: "Imprime")

//func toList(nomes : String...) -> Array<String>{
//    var list = Array<String>()
//    for str in nomes {
//        list.append(str)
//    }
//    return list/
//}

//var listaNomes = toList(nomes: "Adriano", "Noemi","Alice","Milena")
//print(listaNomes)

//func toList<T>(nomes : T...) -> Array<T>{
//    var list = Array<T>()
//    for str in nomes {
//        list.append(str)
//   }
//    return list
//}

//var listaNomes = toList(nomes: "Adriano", "Noemi","Alice","Milena")
//print(listaNomes)

//Exercicio 1

func fatorial(v1 : Int){
    var r : Int = 1
    var i : Int = v1
    while i>0{
        r = r*i
        i=i-1
    }
    print(r)
}
fatorial(v1: 3)

//Exercicio 2

func fibonacci(n: Int) {
    var num1 = 0
    var num2 = 1
    for _ in 0 ..< n {
        let num = num1 + num2
        num1 = num2
        num2 = num
    }
    print("result = \(num2)")
}


fibonacci(n:  4)

//Exercicio 3
func plotar (v1 : Int){
    var j : Int
    var i : Int
    var t : Int
    var lat : String
    var centro : String
    if (v1 % 2 == 0){
        print ("Número é par")
    } else {
        for i in 1...v1{
            if (i % 2 != 0 ){
                lat = ""
                t=(v1 - i)/2
                for j in 1...t {
                    lat = lat + " "
                }
                centro = ""
                for t in  1...i{
                    centro = centro + "*"
                }
                print (lat + centro + lat)
            }
        }
        i = v1-1
        while i>0{
            if (i % 2 != 0 ){
                lat = ""
                t=(v1 - i)/2
                for j in 1...t {
                    lat = lat + " "
                }
                centro = ""
                for t in  1...i{
                    centro = centro + "*"
                }
                print (lat + centro + lat)
            }
            i=i-1
        }
    }
}

plotar(v1: 7)
