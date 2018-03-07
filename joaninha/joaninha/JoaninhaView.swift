//
//  JoaninhaView.swift
//  joaninha
//
//  Created by Bruno De Castro Guaitanele on 02/03/18.
//  Copyright © 2018 Bruno De Castro Guaitanele. All rights reserved.
//

import UIKit

@IBDesignable
class JoaninhaView : UIView{

    
    @IBInspectable
    var asaColor : UIColor = UIColor.red
    
    @IBInspectable
    var pintasColor:UIColor = UIColor.black
    
    @IBInspectable
    var corpoColor:UIColor = UIColor.black
    
    @IBInspectable
    var cabecaColor:UIColor = UIColor.white
    
    @IBInspectable
    var strokeSize: CGFloat = 4
    
    
    /**
     * O desenho foi separado em funções de acordo com as partes da joaninha
     *
     * Nas partes repetitivas (pintas e patas) foram utilizadas subfunções e CGAffineTransform para reaproveitamento de código
     *
     * As cores das partes foram definidas individualmente e aplicados o inspetor para permitir ser configurado pelo xcode
     */
    override func draw( _ rect : CGRect ){
        
        UIColor.black.setStroke()
        
        let centro = CGPoint(x: rect.width/2, y: rect.height/2)
        cabeca(centro,rect)
        corpo(centro,rect)
        
        
    }
    
    func cabeca( _ centro : CGPoint , _ rect : CGRect ){
        antenas(centro)
        
        let cabeca = UIBezierPath(arcCenter: CGPoint(x:centro.x,y:centro.y-50), radius: 30 , startAngle: .pi , endAngle: 3 * .pi, clockwise: true)
        cabeca.lineWidth = strokeSize
        cabecaColor.setFill()
        cabeca.fill()
        cabeca.stroke()
        
    }
    
    func antenas( _ centro : CGPoint){
        
        cabecaColor.setFill()
        
        //antena esquerda
        let antena = UIBezierPath()
        antena.move(to: CGPoint(x:centro.x-12,y:centro.y-78	)	)
        antena.addQuadCurve(to: CGPoint(x:centro.x-40,y:centro.y-97), controlPoint: CGPoint(x: centro.x-20, y: centro.y-100) )
        antena.lineWidth = strokeSize
        antena.stroke()
        
        var bolaAntena = UIBezierPath(arcCenter: CGPoint(x:centro.x-40,y:centro.y-97), radius: 7 , startAngle: .pi , endAngle: 3 * .pi, clockwise: true)
        bolaAntena.lineWidth = strokeSize-1
        bolaAntena.fill()
        bolaAntena.stroke()
        
        //antena direita
        antena.apply(CGAffineTransform(rotationAngle: rad(280)))
        antena.apply(CGAffineTransform(translationX: centro.x-antena.bounds.midX+24, y: centro.y-antena.bounds.midY-86))
        antena.stroke()
        
        bolaAntena = UIBezierPath(arcCenter: CGPoint(x:centro.x+37,y:centro.y-97), radius: 7 , startAngle: .pi , endAngle: 3 * .pi, clockwise: true)
        bolaAntena.lineWidth = strokeSize-1
        bolaAntena.fill()
        bolaAntena.stroke()
        
        
    }
    
    /**
     * Desenha o círculo grande do corpo (inicialmente vermelho)
     */
    func corpo( _ centro: CGPoint, _ rect : CGRect ){
        
        //desenha patas antes do corpo para tampar as pontas da pata com o corpo
        pata(CGPoint(x: centro.x-32,y: centro.y-22))
        
        asaColor.setFill()
        let corpo = UIBezierPath(ovalIn: CGRect(x: centro.x-60, y: centro.y-45, width: 120, height: 130))
        corpo.lineWidth = strokeSize
        corpo.fill()
        corpo.stroke()
        
        asa(centro)
        pintas(centro)
    }
    
    func pata( _ centro : CGPoint ){
        
        let pata = UIBezierPath()
        pata.move(to: centro)
        pata.addQuadCurve(to: CGPoint(x:centro.x-50,y:centro.y-18), controlPoint: CGPoint(x: centro.x-30, y: centro.y+15) )
        pata.lineCapStyle = .round
        pata.lineWidth = strokeSize*2
        pata.stroke()
        
        func proximaPata( _ angulo : Float, _ x : CGFloat , _ y : CGFloat){
            pata.apply(CGAffineTransform(rotationAngle: rad(angulo) ) )
            pata.apply(CGAffineTransform(translationX: centro.x-pata.bounds.midX + x, y: centro.y-pata.bounds.midY+y))
            pata.stroke()
        }
        
        proximaPata(150, -35, 43 ) //esq2
        proximaPata(-25, -20, 90) //esq3
        proximaPata(180, 90, -10) //dir1
        proximaPata(200, 98, 40) //dir2
        proximaPata(35, 95, 85) //dir3
        
    }

    /**
     * Desenha triangulo do meio, definindo a asa da joaninha
     **/
    func asa( _ centro : CGPoint ){
        
        let asa = UIBezierPath()
        asa.move(to: CGPoint(x:centro.x-20,y:centro.y+83))
        asa.addQuadCurve(to: CGPoint(x:centro.x,y:centro.y-43), controlPoint: CGPoint(x: centro.x, y: centro.y+60))
        asa.addQuadCurve(to: CGPoint(x:centro.x+20,y:centro.y+81), controlPoint: CGPoint(x: centro.x, y: centro.y+60))
        
        //fecha a base do triangulo, com a curva seguindo o corpo da joaninha, para poder pintar
        asa.addQuadCurve(to: CGPoint(x:centro.x-20,y:centro.y+81), controlPoint: CGPoint(x: centro.x, y: centro.y+88))
        asa.lineWidth = strokeSize
        corpoColor.setFill()
        asa.fill()
        asa.stroke()
        
    }
    
    func pintas( _ centro : CGPoint ){
        
        pintasColor.setFill()
        let pinta = UIBezierPath(arcCenter: CGPoint(x:centro.x-30,y:centro.y+52), radius: 10 , startAngle: .pi , endAngle: 3 * .pi, clockwise: true)
        pinta.fill()
        pinta.lineWidth = strokeSize-1
        pinta.stroke()
        
        func proximaPinta( _ x : CGFloat , _ y : CGFloat, _ scale : CGFloat){
            pinta.apply(CGAffineTransform(scaleX: scale, y: scale))
            pinta.apply(CGAffineTransform(translationX: centro.x-pinta.bounds.midX + x, y: centro.y-pinta.bounds.midY + y))
            
            pinta.fill()
            pinta.stroke()
        }
        
        proximaPinta(30, 50,1)
        proximaPinta(-35, 19,1.3)
        proximaPinta(34, 19,1)
        proximaPinta(-24, -10,0.8)
        proximaPinta(24, -10,1)
        proximaPinta(0, -28,0.9)
        
    }
    
    func rad( _ degree : Float ) -> CGFloat {
        let rad : CGFloat = CGFloat(degree * .pi / 180)
        return rad
    }
    
    
}
