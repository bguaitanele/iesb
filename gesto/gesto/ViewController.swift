//
//  ViewController.swift
//  gesto
//
//  Created by HC2MAC13 on 07/03/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var faceView : FaceView! {
        didSet {
            let action = #selector(ViewController.pan(recognizer:))
            let pan = UIPanGestureRecognizer(target: self, action: action)
            faceView.addGestureRecognizer(pan)
        }
    }
    
    @objc private func pan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed : fallthrough
        case .ended:
//            let translation = recognizer.translation(in: faceView)
            faceView.center = recognizer.location(in: faceView)
//            recognizer.setTranslation(CGPoint.zero, in: faceView)
        default: break
            
            
        }
        
    }


}

