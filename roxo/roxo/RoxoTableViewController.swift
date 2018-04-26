//
//  RoxoTableViewController.swift
//  roxo
//
//  Created by bruno on 25/04/18.
//  Copyright © 2018 bruno. All rights reserved.
//

import UIKit

class RoxoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bolaView = BotaoBase()
        bolaView.backgroundColor = UIColor.clear
        bolaView.frame = CGRect(x: view.frame.width/2-50, y: view.frame.height-80, width: 100, height: 100)
        
        tabBarController?.view.addSubview(bolaView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
        
        
    }

}
