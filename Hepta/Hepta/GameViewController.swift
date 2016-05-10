//
//  GameViewController.swift
//  Hepta
//
//  Created by Essam on 5/1/16.
//  Copyright (c) 2016 Heifa Productions. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController , GameSceneDelegate {
//    MARK:- Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLevel = 0 //Calls render level in the property observer
        
    }
    
    private func renderLevel(level: Int){
        if let scene = GameScene(fileNamed:"Level\(level)") {
            // Configure the view.
            scene.gameSceneDelegate = self
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
//    MARK:- Helpers
    
    func onLevelPassed() {
        currentLevel = currentLevel + 1
    }
    
    func onLevelFailed() {
        renderLevel(currentLevel)
    }
    
    private var currentLevel = 0{
        didSet{
            self.renderLevel(currentLevel)
        }
    }
    
//    MARK:- Properties
}
