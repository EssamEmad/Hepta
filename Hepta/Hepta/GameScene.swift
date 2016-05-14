//
//  GameScene.swift
//  Hepta
//
//  Created by Essam on 5/1/16.
//  Copyright (c) 2016 Heifa Productions. All rights reserved.
//

import SpriteKit

protocol GameSceneDelegate{
    func onLevelPassed()
    func onLevelFailed(ball: Ball)
}

class GameScene: SKScene {
    
    struct Constants {
        static let MINIMUM_SWIPE: CGFloat = 20
    }
    
    
    
    //MARK:- Overriden methods
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        setup()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        flickStartLocation = touches.first?.locationInNode(self)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let ball = ball  {
            if !ball.isMoving{
                if let start = flickStartLocation, end = touches.first?.locationInNode(self){
                    if let ballMovementDirection = getBallMovementDirection(start, end: end){
                        self.ballMovementDirection = ballMovementDirection
                        ball.move(ballMovementDirection.x * 5,y: ballMovementDirection.y * 5)
                        ball.isMoving = true
                    }
                }
            }
        }
    }
    

    
    //MARK:- Helper methods
    
    //calculates the displacement vector of the ball based on the users starting point and end point of the flick motion
    private func getBallMovementDirection( start: CGPoint, end: CGPoint) -> CGPoint? {
        
        var realDirection: CGPoint? = nil
        let dx =  end.x - start.x
        let dy =  end.y - start.y
        if abs(dx) + abs(dy) > Constants.MINIMUM_SWIPE {
            
            realDirection = Helpers.greatestNumberSmallerThanOne((dx,dy))
            
            if dx < 0{
                realDirection?.x = (realDirection?.x)! * -1
            }
            if dy < 0{
                realDirection?.y =  (realDirection?.y)! * -1
            }
            
            
        }
        return realDirection
    }
    
//    MARK:- Helpers
    
    private func setup(){
        self.enumerateChildNodesWithName("//*") { (node, stop ) in
            if node.name == "Ball"{
                self.ball = node as! Ball
                self.ball?.physicsBody?.contactTestBitMask = self.ballCategory
                self.ballInitialPosition = (self.ball?.position)!
            }
        }
        
            
        

    }
    
    //MARK:- Properties
    var gameSceneDelegate: GameSceneDelegate?

    // We keep track of the flick motion start position to calculate
    // the swiping direction
    private var flickStartLocation:CGPoint? = nil
    private var ballMovementDirection: CGPoint?  = nil
    private var ball:Ball?
    private var ballInitialPosition: CGPoint?
    
     let ballCategory: UInt32 = 0x1 << 1

    
}


extension GameScene: SKPhysicsContactDelegate{
    
    func didBeginContact(contact: SKPhysicsContact) {
        if  contact.bodyB.node is Obstacle || contact.bodyA.node is Obstacle{
            gameSceneDelegate?.onLevelFailed(ball!)
        } else if  contact.bodyB.node?.name == "Hole" || contact.bodyA.node?.name == "Hole"{
            gameSceneDelegate?.onLevelPassed()
        }
        else if contact.bodyA.node is GameScene{
            if let ball = ball {
            gameSceneDelegate?.onLevelFailed(ball)
            }
        }
    }
    
}
