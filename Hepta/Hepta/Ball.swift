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
//        let moveAction = SKAction.moveByX(x,y: y, duration: 0.0000000000001)
//        runAction(moveAction)
        self.physicsBody?.applyImpulse(CGVectorMake(x * 10,y * 10))
    }
    
    
    
//    MARK:- Flags
    var isMoving = false
}