//
//  ProdutoCadastroTableViewController.swift
//  hackatonIOS
//
//  Created by HC2MAC13 on 11/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ProdutoCadastroTableViewController: UITableViewController {

    
    @IBOutlet weak var tituloField: UITextField!
    @IBOutlet weak var descricaoField: UITextField!
    @IBOutlet weak var precoField: UITextField!
    @IBOutlet weak var fotoEscolhidaImageView: UIImageView!
    
    @IBAction func cadastrar(_ sender: UIButton) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let produto = Produtos(context: context)
        produto.nome = tituloField.text
        produto.descricao = descricaoField.text
        produto.preco = precoField.text

        if let image:UIImage = fotoEscolhidaImageView.image {
            let imageData = UIImagePNGRepresentation(image)
            produto.foto = imageData
        }
        
        
        do{
            try context.save()
            
            let alert = UIAlertController(title: "Salvo", message: "Os dados foram salvos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                switch action.style{
                default:
                    print("fechar")
                }
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        } catch {
            print("Erro ao salvar")
        }
        
        
        
        
    }
    
    @IBAction func onEscolherFoto(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        let alert = UIAlertController(title: "Escolher uma foto", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { [weak self] (action) in
                picker.sourceType = .camera
                self?.show(picker, sender: action)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { [weak self] (action) in
            picker.sourceType = .photoLibrary
            self?.show(picker, sender: action)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        show(alert, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   


}

extension ProdutoCadastroTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) { [weak self] in
            if let image = (info[UIImagePickerControllerEditedImage] ?? info[UIImagePickerControllerOriginalImage]) as? UIImage {
                UIView.transition(with: self!.fotoEscolhidaImageView, duration: 0.5, options: .transitionFlipFromRight, animations: { [weak self] in
                    self?.fotoEscolhidaImageView.image = image
                    }, completion: nil)
            }
        }
    }
}
