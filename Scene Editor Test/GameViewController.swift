//
//  GameViewController.swift
//  Scene Editor Test
//
//  Created by George Ruzek on 4/11/16.
//  Copyright (c) 2016 Sharp Top Software. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    private var scenes : [String: Scene] =
        [ "logo" : LogoScene(fileNamed:"LogoScene")!,
          "menu" : MenuScene(fileNamed:"MenuScene")!]
    
    private func showScene( sceneName : String ) -> SKScene? {
        let scene = scenes[sceneName]
        
        if scene != nil  {
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene!.scaleMode = .AspectFill
            scene!.viewController = self
            
            skView.presentScene(scene)
        }
        
        return scene
    }
    
    func showGameScene() {
        let scene = GameScene(size: (view?.bounds.size)!)
        
        scene.loadTiles("level000")
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
            
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        scene.viewController = self
            
        skView.presentScene(scene)
     }

    func showLogoScene() {
        self.showScene("logo")
    }

    func showMenuScene() {
        self.showScene("menu")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLogoScene()
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
