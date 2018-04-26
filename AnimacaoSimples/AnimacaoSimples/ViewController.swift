//
//  ViewController.swift
//  AnimacaoSimples
//
//  Created by HC2MAC13 on 25/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quadrado: UIView!{
        didSet{
            let tap = UITapGestureRecognizer(target: self, action: #selector(ficarPreto(_:)))
            quadrado.isUserInteractionEnabled = true
            quadrado.addGestureRecognizer(tap)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 5, delay: 1, options: [.curveEaseInOut,.autoreverse], animations: { [weak self] in
                self?.quadrado.center = CGPoint(x:0, y:0)
                self?.quadrado.backgroundColor = UIColor.yellow
                self?.quadrado.layer.cornerRadius = self!.quadrado.frame.size.width/2
            }, completion: { [weak self] (interrupted) in
                self?.quadrado.center = self!.view.center
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func ficarPreto( _ sender : UITapGestureRecognizer){
        UIView.transition(with: quadrado, duration: 2, options: [.curveLinear,.transitionFlipFromLeft], animations: { [weak self] in
            self?.quadrado.backgroundColor = UIColor.black
            }, completion: nil)
    }



}

