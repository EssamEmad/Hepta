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
//        dx = x
//        dy = y
//        let moveAction = SKAction.moveByX(x,y: y, duration: 0.0000000000001)
//        runAction(moveAction)
        
        self.physicsBody?.applyImpulse(CGVectorMake(x * 10,y * 10))
        
        
    }
    
    func die(){
        print("die called")
//        let reset: SKAction = SKAction.moveTo(position, duration: 0)
//        let holdStill = SKAction.runBlock{
//            self.physicsBody?.velocity = CGVectorMake(0, 0)
//        }
        let dieThenLive: SKAction = SKAction.sequence([fadeOut])
        self.runAction(dieThenLive)
    }

    
    let fadeOut: SKAction = SKAction.fadeOutWithDuration(0.5)
    let fadeIn: SKAction = SKAction.fadeInWithDuration(0.5)
    
    

//    var dx: CGFloat
//    var dy: CGFloat

    
//    MARK:- Flags
    var isMoving = false
}