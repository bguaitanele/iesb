//
//  ViewController.swift
//  Teclado
//
//  Created by HC2MAC13 on 21/03/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit


class ViewController: UIViewController{

    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!{
        didSet{
            valorInicial = bottomConstraint.constant
        }
    }
    
    @IBOutlet weak var textField: UITextField! {
        didSet{
            textField.delegate = self
        }
    }
    
    var valorInicial: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(tecladoApareceu(_:)) ,
                                               name: Notification.Name.UIKeyboardDidShow,
                                               object: view.window)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(tecladoDesapareceu(_:)) ,
                                                name: Notification.Name.UIKeyboardDidHide,
                                                object: view.window)
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textField.resignFirstResponder) )
        self.view.addGestureRecognizer(tapGesture)

    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func tecladoApareceu( _ sender : Notification ){
        print("telcado entrou")
        if let frame = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect{
            bottomConstraint.constant += frame.size.height
            
        }
    }

    @objc private func tecladoDesapareceu( _ sender : Notification ){
        print("telcado saiu")
        bottomConstraint.constant = valorInicial
        
    }

    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

