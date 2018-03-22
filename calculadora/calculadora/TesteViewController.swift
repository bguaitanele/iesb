//
//  TesteViewController.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 20/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import UIKit

class TesteViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numero(_ sender: UIButton) {
        
        display.text = sender.titleLabel?.text
    }
}
