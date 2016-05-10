//
//  Ball.swift
//  Hepta
//
//  Created by Essam on 5/10/16.
//  Copyright © 2016 Hepta Productions. All rights reserved.
//

import Foundation
import SpriteKit

class Ball: SKSpriteNode {
    
    
    func move(x:CGFloat, y:CGFloat){
        dx = x
        dy = y
//        let moveAction = SKAction.moveByX(x,y: y, duration: 0.0000000000001)
//        runAction(moveAction)
        
        self.physicsBody?.applyImpulse(CGVectorMake(x * 10,y * 10))
        
    }
    
    func die(){
        while(self.alpha > 0 && self.physicsBody?.velocity.dx > 0 && self.physicsBody?.velocity.dy > 0){
            self.alpha = self.alpha - 0.02
            self.physicsBody?.applyForce(CGVectorMake(dx*10,dy*10))
        }
    }
    
    
    var dx: CGFloat
    var dy: CGFloat
    
//    MARK:- Flags
    var isMoving = false
}