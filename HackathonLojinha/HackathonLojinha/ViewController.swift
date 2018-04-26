//
//  ViewController.swift
//  HackathonLojinha
//
//  Created by Pedro Henrique on 11/04/2018.
//  Copyright © 2018 IESB. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var fotoEscolhidaImageView: UIImageView!
    
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
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
