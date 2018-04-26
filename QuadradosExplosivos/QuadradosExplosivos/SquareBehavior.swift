//
//  SquareBehavior.swift
//  QuadradosExplosivos
//
//  Created by HC2MAC13 on 25/04/2018.
//  Copyright © 2018 HC2MAC13. All rights reserved.
//

import UIKit

class SquareBehavior: UIDynamicBehavior {

    private var gravity: UIGravityBehavior?
    private var collision: UICollisionBehavior?
    private var bounce: UIDynamicItemBehavior?
    
    override init() {
        super.init()
        
        gravity = UIGravityBehavior()
        gravity?.magnitude = 0.7
        
        collision = UICollisionBehavior()
        collision?.translatesReferenceBoundsIntoBoundary = true
        
        bounce = UIDynamicItemBehavior()
        bounce?.elasticity = 0.6
        
        addChildBehavior(gravity!)
        addChildBehavior(collision!)
        addChildBehavior(bounce!)
        
    }
    
    public func addItem( _ item : UIDynamicItem){
        gravity?.addItem(item)
        collision?.addItem(item)
        bounce?.addItem(item)
    }
    
    public func removeItem( _ item : UIDynamicItem ){
        gravity?.removeItem(item)
        collision?.removeItem(item)
        bounce?.removeItem(item)
    }
}


class BounceBehavior : UIDynamicItemBehavior{
    
}
