//
//  MasterTableViewController.swift
//  ExemploAula06
//
//  Created by HC2MAC13 on 14/03/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        var color = UIColor.black
        switch index {
        case 0: color = UIColor.blue//azul
        case 1: color = UIColor.green // verde
        case 2: color = UIColor.yellow //amarelo
        default: break //preto
        }
        //remove a selecao da celula etre as troca de tela
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "mostrarComSegue", sender: color)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarComSegue" {
            if let destination = segue.destination as? ViewController {
                destination.color = sender as? UIColor
            }
            
        }
    }

}
