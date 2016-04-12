//
//  LogoScene.swift
//  Scene Editor Test
//
//  Created by George Ruzek on 4/11/16.
//  Copyright © 2016 Sharp Top Software. All rights reserved.
//

import UIKit
import SpriteKit

class LogoScene: Scene {
    
    var sceneDuration : NSTimeInterval = 3.75
    
    override func didMoveToView(view: SKView) {
        // set mtn and logo alpha to 0
        
        if let mtnSprite = self.childNodeWithName("mtn") {
            mtnSprite.alpha=0
        }
        else {
            NSLog("didnt find mtn")
        }
    
        if let wordsSprite = self.childNodeWithName("words") {
            wordsSprite.alpha=0
        }
        else {
            NSLog( "didnt find the words")
        }
        
        NSTimer.scheduledTimerWithTimeInterval(sceneDuration,
                                               target: self,
                                               selector: #selector(LogoScene.nextScene),
                                               userInfo:nil,
                                               repeats: false)
    }
    
    func nextScene() {
        viewController!.showMenuScene()
    }
}
