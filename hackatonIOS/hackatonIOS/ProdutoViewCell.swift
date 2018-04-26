//
//  ProdutoViewCell.swift
//  hackatonIOS
//
//  Created by HC2MAC13 on 11/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ProdutoViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var conteudoLabel: UILabel!
    
    @IBOutlet weak var qtdProdutos: UIStepper!
    @IBOutlet weak var qtdLabel: UILabel!
    
    @IBOutlet weak var fotoProdutoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func cadastrar(_ sender: UIButton) {
        print(qtdProdutos.value)
    }
    
    @IBAction func alterarQuantidadeProdutos(_ sender: UIStepper) {
        qtdLabel.text = String( qtdProdutos.value )
    }
    
    
    public func configurar( comProduto produto : Produtos ){
        qtdProdutos.value = 1
        qtdLabel.text = String(qtdProdutos.value)
        
        
        tituloLabel.text = produto.nome
        conteudoLabel.text = produto.descricao
        precoLabel.text = produto.preco
        
        if produto.foto != nil{
            fotoProdutoImageView.image = UIImage(data: produto.foto! )
            
        }
        
        
        
//        if let fotoDB = produto.foto as? UIImage{
//            fotoProdutoImageView.image = fotoDB
//        }
//
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
