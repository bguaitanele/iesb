//
//  File_A.swift
//  Aula1
//
//  Created by HC2MAC13 on 19/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import Foundation
class SerVivo{
    var idPai : Int!
    var nome : String!
    
    init(idPai : Int , nome : String) {
        self.idPai = idPai
        self.nome = nome
    }
}
var nomesDic :[Int : SerVivo] = [654: SerVivo(idPai: 231, nome: "Canabis"),
                                 444 : SerVivo(idPai: 345, nome:"Rosales"),
                                 345 : SerVivo(idPai: 0, nome: "Plantae"),
                                 123 : SerVivo(idPai: 654, nome: "Sativa"),
                                 231 : SerVivo(idPai: 444, nome: "Canabaceae")]



//print(nomesDic[231])
//print(arvoreDic[231])
//print(estadosDic["RJ"])

func getarvoreSerVivo(id :Int ) -> String{
    
}

