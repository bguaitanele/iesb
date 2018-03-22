//
//  CalculadoraTableViewController.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 20/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import UIKit

class CalculadoraTableViewController: UITableViewController {

    
    @IBOutlet weak var displayText: UILabel!
    
    @IBOutlet weak var equacaoText: UILabel!
    
    private var isDigitando = false;
    
    private var model = CalculadoraModel()
    
    private var ultimoDigito : String?
    
    private var isDecimal = false
    
    private var displayDouble : Double {
        set{
            displayText.text = String(newValue)
        }
        
        get{
            return Double(displayText.text!)!
        }
    }
    
    private var displayFormatado : String {
        set {
            
            
            var valorFromInteger: String = ""
            
            
            if let i = Int(newValue){
                valorFromInteger = String(i)
            }else if let f = Double(newValue){
                valorFromInteger = String(Int(f))
            }
            
            var valor : String!
            switch newValue {
            case "":
                displayText.text = ""
            case valorFromInteger+".0":
                displayText.text = isDecimal ? newValue : valorFromInteger
            case ".":
                displayText.text = "0."
                isDecimal = true
            default:
                
                //quando digitado ".", apesar do numero nao ser um double valido, deve aparecer em tela
                if(ultimoDigito == "."){
                    if(!isDecimal){
                        displayText.text = newValue
                        isDecimal = true
                    }
                    //quando formata o numero, os "0" à direita na casa decimal sao removidos. Eles devem permanecer
                }else if(isDecimal && ultimoDigito == "0" ){
                    displayText.text = newValue
                    
                }else{
                    if let d = Double(newValue) {
                        valor = String( d )
                        valor = ( valor == valorFromInteger+".0" ) ? valorFromInteger : valor
                        displayText.text = valor
                    }
                }
                
            }
        }
        
        get{
            return displayText.text!
        }
        
    }
    
    @IBAction func digitarNumero(_ sender: UIButton) {
        
        
        ultimoDigito = sender.titleLabel?.text
        if ultimoDigito != nil {

            if(!isDigitando){
                isDigitando = true
                displayFormatado = ""
            }

            displayFormatado = displayText.text! + ultimoDigito!
        }
        
    }
    
    @IBAction func calcular(_ sender: UIButton) {
        if let operacao = sender.titleLabel?.text {
            displayFormatado = String(model.calcular(displayDouble,operacao,isDigitando))
            equacaoText.text = model.equacao.texto
            isDigitando = false
            isDecimal = false
        }
    }
    
    @IBAction func zerar() {
        model.zerar()
        model.equacao = Equacao()
        isDigitando = false
        displayFormatado = "0"
        isDecimal = false
        equacaoText.text = model.equacao.texto
        
    }
    
    @IBAction func grafico( _ sender : UIButton){
        performSegue(withIdentifier: "mostraGrafico", sender: model.equacao )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostraGrafico" {
            if let destination = segue.destination as? GraficoViewController {
                destination.equacao = sender as? Equacao
            }
            
        }
    }

}
