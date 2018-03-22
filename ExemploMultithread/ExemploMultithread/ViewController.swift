//
//  ViewController.swift
//  ExemploMultithread
//
//  Created by HC2MAC13 on 21/03/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let enderecoImagem = "https://www.wallpaperup.com/uploads/wallpapers/2016/06/24/991808/9ab236cccae5470451c20329ca43ec6b.jpg"
    
    var imagem : UIImage? {
        didSet{
            DispatchQueue.main.async(execute: exibirImagem)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        indicator.startAnimating()
        super.viewDidAppear(animated)
        let backgroundQueue = DispatchQueue.global(qos: .userInitiated)
        backgroundQueue.async(execute: baixarImagem )
    }

    private func baixarImagem() {
        
        if let url = URL(string: enderecoImagem){
            do{
                let data = try Data(contentsOf: url)
                imagem = UIImage(data: data)
            }catch{
                DispatchQueue.main.async(execute: indicator.stopAnimating )
                debugPrint(error)
            }
        }
        
    }
    
    private func exibirImagem(){
        guard let img = self.imagem else { return }
        imageView.image = img
        indicator.stopAnimating()
    }
    
        
        
            
}



