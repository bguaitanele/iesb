//
//  ViewController.swift
//  calculadora
//
//  Created by HC5MAC10 on 22/11/17.
//  Copyright © 2017 IESB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var usuarioDigitando = false
    
    var valorAcumulado : Double?
    
    private var valorComputado : Double {
        get {
            return Double(display.text!)!
        }
        
        set{
           display.text = String(newValue)
        }
    }
    
    @IBAction func limpar(_ sender: UIButton) {
        
        display!.text = "0"
        usuarioDigitando = false
    }
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            
            if usuarioDigitando {
                display.text = display.text! + digit
            }else{
                usuarioDigitando = true
                display.text = digit
            }
        }
    }
    
    @IBAction func operacao(_ sender: UIButton) {
        usuarioDigitando = false
        if let operador = sender.titleLabel?.text! {
            switch operador {
                case "π": valorComputado = Double.pi
                case "+": realizarOperacaoBinaria(operador)
                default: break
                
                }
        }
        
    }
    @IBAction func performOperation(_ sender: UIButton) {
    }
    
    private func realizarOperacaoBinaria( _ simbolo : String ){
        if( valorAcumulado != nil ){
            switch simbolo{
                case "+":valorComputado = valorAcumulado! + valorComputado
                default: break
            }
            
        }else{
            valorAcumulado = valorComputado
            valorComputado = 0
        }
    }
    
    

}

