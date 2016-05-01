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
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        flickStartLocation = touches.first?.locationInNode(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let start = flickStartLocation {
            let end = touches.first?.locationInNode(self)
            let dx = start.x - (end?.x)!
            let dy = start.y - (end?.y)!
            print("x =  \(dx)")
            print("y = \(dy)")
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    //MARK:- Helper methods
    
    
    //MARK:- Properties
    
    private var flickStartLocation:CGPoint?
}
