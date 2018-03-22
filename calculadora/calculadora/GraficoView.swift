//
//  GraficoView.swift
//  calculadora
//
//  Created by Bruno De Castro Guaitanele on 14/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import UIKit



@IBDesignable
class GraficoView: UIView {

    @IBInspectable
    var pointsPerUnit : CGFloat = 10
    
    let axes = AxesDrawer()
    
    override func draw(_ rect: CGRect) {
        
        
        pointsPerUnit = rect.height/10
        axes.drawAxes(in: rect, origin: center, pointsPerUnit: pointsPerUnit)
        
        
        
        
        
        
        desenhaSenoide(rect,angulo: 50, raio:1)
        
        
        
    
    
    }
    
    func desenhaEquacao(){
        
    }
    
    //recebe sin(60)
    func desenhaSenoide( _ rect : CGRect, angulo : CGFloat, raio :CGFloat = 1){
        
        
        let centro = CGPoint(x: rect.width/2, y: rect.height/2)
        
        let pontoXInicial = rect.width / 2
        
        
        let path = UIBezierPath()
        path.lineWidth = 2
        UIColor.red.setStroke()
        var pontoAtual = CGPoint(x: 0, y: centro.y)
        path.move(to: pontoAtual )
        let stepX = rad(angulo) * pointsPerUnit
        var raio = raio*pointsPerUnit
        
        repeat{
            raio = -raio
            pontoAtual.x = pontoAtual.x+stepX
            path.addQuadCurve(to: pontoAtual , controlPoint: CGPoint(x: pontoAtual.x-stepX/2 , y: centro.y+raio))
            
        }while pontoAtual.x < rect.width
        
        path.stroke()
       
    }
    
    func rad( _ degree : CGFloat ) -> CGFloat{
        return degree * .pi / 180
    }
}
