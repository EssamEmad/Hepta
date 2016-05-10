//
//  GameScene.swift
//  Hepta
//
//  Created by Essam on 5/1/16.
//  Copyright (c) 2016 Hepta Productions. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    struct Constants {
        static let MINIMUM_SWIPE: CGFloat = 20
    }
    //MARK:- Overriden methods
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        if let someSpriteNode = self.childNodeWithName("Ball") as? Ball, reflector = self.childNodeWithName("Test Reflector"){
            reflector.physicsBody?.dynamic = false 
            ball = someSpriteNode
            
        
        }
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
    
    override func update(currentTime: CFTimeInterval) {
//        if let ball = ball, ballDirection = ballMovementDirection {
//            ball.move(ballDirection.x * 5,y: ballDirection.y * 5)        }
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
    
    
    //MARK:- Properties
    
    // We keep track of the flick motion start position to calculate
    // the swiping direction
    private var flickStartLocation:CGPoint? = nil
    private var ballMovementDirection: CGPoint?  = nil
    private var ball:Ball?
    
   
    
}
