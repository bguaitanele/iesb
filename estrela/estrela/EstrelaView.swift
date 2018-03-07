//
//  EstrelaView.swift
//  Estrela dinâmica
//
//  Created by Bruno Guaitanele on 28/02/18.
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
    
    /**
     * O desenho é feito utilizando duas circunferências, uma grande e uma pequena
     * A estrela é feita alternando a cada desenho entre a circunferência. Caso, as
     * duas circunferências tenham o mesmo tamanho, o desenho final é uma forma com o
     * dobro de pontos do número de braços (ex: uma estrela de 5 pontos vira um decagono)
     *
     * É feito inicialmente a divisão de ângulos de acordo com o número de pontos. Para a divisão
     * foi utilizado o número 6.283185 que é o radiano de 360.
     * É feito então um loop passando por cada um desses ângulos, utilizando as seguintes formas para
     * extrair as coordenadas x,y do ponto a ser desenhado:
     *
     * x: cosseno(angulo) x raio
     * y: seno(angulo) x raio
     *
     * Lembrando que o raio em cada etapa do loop se alternará entre o grande e o pequeno.
     * Somam-se aos pontos x e y o valor do ponto do centro, para que a estrela fique centrelizada.
     */
    override func draw( _ rect: CGRect){
        
        pontos *= 2
        let path = UIBezierPath()
        var raio = raioGrande
        let centro = CGPoint(x: rect.width/2, y: rect.height/2)
        let tamanhoAngulo = 6.283185/pontos
        var coordenada = CGPoint(x:centro.x+raio, y:centro.y ) //ponto inicial localizado na extremidade dir. do eixo x
        var angulo: CGFloat!
        path.move(to: coordenada)
        raio = raioPequeno
        for  ponto in stride(from: 0, to: pontos, by: 1){
            raio = raio == raioGrande ? raioPequeno : raioGrande
            angulo = tamanhoAngulo * ponto
            coordenada = CGPoint(x: centro.x+cos(angulo)*raio, y: centro.y+sin(angulo)*raio)
            path.addLine(to: coordenada)
        }
        
        path.close()
        strokeColor.setStroke()
        fillColor.setFill()
        path.lineWidth = strokeSize
        path.fill()
        path.stroke()
        
    }
    
}

