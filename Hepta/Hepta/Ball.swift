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
        
        self.physicsBody?.applyImpulse(CGVectorMake(x * 2.5,y * 2.5))
        
        
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