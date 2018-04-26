//
//  ViewController.swift
//  hackatonIOS
//
//  Created by HC2MAC13 on 11/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let produtos = NSEntityDescription.insertNewObject(forEntityName: "Produtos", into: context)
        
        produtos.setValue("wesley", forKey: "nome")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

