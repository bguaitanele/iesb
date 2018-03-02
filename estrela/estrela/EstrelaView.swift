//
//  TriangleView.swift
//  primeiroDesenho
//
//  Created by HC2MAC13 on 28/02/18.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//
import UIKit

@IBDesignable
class EstrelaView : UIView{
    
    @IBInspectable
    var strokeColor: UIColor = UIColor.black
    
    @IBInspectable
    var fillColor: UIColor = UIColor.yellow
    
    @IBInspectable
    var strokeSize: CGFloat = 1
    
    @IBInspectable
    var pontos: CGFloat = 5
    
    @IBInspectable
    var raioPequeno: CGFloat = 30
    
    @IBInspectable
    var raioGrande: CGFloat = 100
    
    override func draw( _ rect: CGRect){
        
        let tamanhoAngulo = 360/pontos
        var raio = raioGrande
        let centro = CGPoint(x: rect.width/2, y: rect.height/2)
        pontos *= 2
        var arrPontos: [CGPoint] = []
        var ponto : CGFloat = 0;
        var coordenada = CGPoint(x: centro.x , y: centro.y - raio )
        var x:CGFloat!, y:CGFloat!,anguloRad : CGFloat!,angulo : CGFloat!
        
        let path = UIBezierPath()
        
        path.move(to: coordenada )
        
        raio = raioPequeno
        while ponto <= pontos {
            if raio == raioGrande{
                raio = raioPequeno
            }else{
                raio = raioGrande
            }
            
            angulo = tamanhoAngulo * ponto
            if(angulo == 0){
                coordenada = CGPoint(x: centro.x,y: centro.y - raio )
            }else if(angulo < 90){
                
                anguloRad = rad(90-angulo)
                x = raio * cos(anguloRad )
                y = raio * sin(anguloRad )
                coordenada = CGPoint(x: x + centro.x , y: centro.y - y )
                
            }else if(angulo == 90){
                
                coordenada = CGPoint(x: centro.x + raio , y: centro.y)
                
            }else if(angulo < 180){
                
                anguloRad = rad(180-angulo)
                x = raio * sin(anguloRad)+centro.x
                y = raio * cos(anguloRad)+centro.y
                coordenada = CGPoint(x: x, y: y)
                
            }else if(angulo == 180){
                
                coordenada = CGPoint(x: centro.x, y: centro.y+raio)
                
            }else if(angulo < 270){
                
                anguloRad = rad(270-angulo);
                x = centro.x - raio * cos(anguloRad);
                y = centro.y + raio * sin(anguloRad);
                coordenada = CGPoint(x: x, y: y)
                
            }else if(angulo == 270){
                
                coordenada = CGPoint(x: centro.x - raio, y: centro.y)
                
            }else if(angulo < 360){
                
                anguloRad = rad(360-angulo);
                x = centro.x - raio * sin(anguloRad);
                y = centro.y - raio * cos(anguloRad);
                coordenada = CGPoint(x: x, y:y)
                
            }
            arrPontos.append(coordenada)
            path.addLine(to: coordenada)

            ponto += 1;
        }
        
        path.close()
        strokeColor.setStroke()
        fillColor.setFill()
        path.lineWidth = strokeSize
        path.fill()
        path.stroke()
        
    }
    
    func rad(_ degree : CGFloat ) -> CGFloat{
        return degree * .pi / 180
    }
    
}

