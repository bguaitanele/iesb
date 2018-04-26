//
//  TesteView.swift
//  testesubview
//
//  Created by HC2MAC13 on 18/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

@IBDesignable
class TesteView: UIView {

    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: rect.height*0.8))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height*0.8))
        UIColor.red.setFill()
        path.fill()
    }

}
