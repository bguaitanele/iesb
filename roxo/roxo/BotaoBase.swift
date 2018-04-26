//
//  BotaoBase.swift
//  roxo
//
//  Created by bruno on 25/04/18.
//  Copyright © 2018 bruno. All rights reserved.
//

import UIKit

@IBDesignable
class BotaoBase: UIView {

    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: 0, endAngle: 6.8, clockwise: true)
        let color = UIColor(displayP3Red: 20/255, green: 186/255, blue: 1, alpha: 1)
        color.setFill()
        path.fill()
    }

}
