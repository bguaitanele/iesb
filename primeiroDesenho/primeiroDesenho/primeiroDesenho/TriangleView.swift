//
//  TriangleView.swift
//  primeiroDesenho
//
//  Created by HC2MAC13 on 28/02/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//
import UIKit

@IBDesignable
class TriangleView : UIView{
    
    @IBInspectable
    var strokeColor: UIColor = UIColor.black
    
    @IBInspectable
    var fillColor: UIColor = UIColor.yellow
    
    @IBInspectable
    var strokeSize: CGFloat = 3
    
    override func draw( _ rect: CGRect){
        
        let lados: Int = 3
        let raio: Int = 10
        let tamanhoBraco: Int = 50
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.width/2 ,y: 0))
        
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height ))
        
        path.close()
        
        
        strokeColor.setStroke()
        fillColor.setFill()
        
        path.lineWidth = strokeSize
        path.fill()
        path.stroke()
        
    }
}
