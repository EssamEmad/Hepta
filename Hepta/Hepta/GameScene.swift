//
//  GameScene.swift
//  Hepta
//
//  Created by Essam on 5/1/16.
//  Copyright (c) 2016 Hepta Productions. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    //MARK:- Overriden methods
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        ball = self.childNodeWithName("Ball")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        flickStartLocation = touches.first?.locationInNode(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let start = flickStartLocation {
            let end = touches.first?.locationInNode(self)
            let dx =  (end?.x)! - start.x
            let dy =  (end?.y)! - start.y
            flickDirection = (dx,dy)
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        if let direction = flickDirection, ball = ball{
            var realDirection = Helpers.greatestNumberSmallerThanOne(direction)
            if direction.0 < 0{
                realDirection.0 = realDirection.0 * -1
            }
            if direction.1 < 0{
                realDirection.1 =  realDirection.1 * -1
            }
        let moveAction = SKAction.moveByX(realDirection.0 ,y: realDirection.1, duration: 0.0000000000001)
            ball.runAction(moveAction)
        }
        
    }
    
    //MARK:- Helper methods
    
    
    //MARK:- Properties
    
    private var flickStartLocation:CGPoint? = nil
    private var flickDirection: (x:CGFloat, y:CGFloat)?  = nil
    private var ball:SKNode? = nil
    
}
