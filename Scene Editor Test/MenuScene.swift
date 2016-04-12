//
//  MenuScene.swift
//  Scene Editor Test
//
//  Created by George Ruzek on 4/11/16.
//  Copyright © 2016 Sharp Top Software. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: Scene {

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let path = NSBundle.mainBundle().pathForResource("Sparklies", ofType: "sks")
        let sparklies = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        
        sparklies.position = CGPointMake(self.size.width/2, self.size.height/2)
        sparklies.name = "goldSparkles"
        sparklies.targetNode = self.scene
                
        self.addChild(sparklies)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let touchedNode = self.nodeAtPoint(touchLocation)
        if(touchedNode.name == "newGame"){
            viewController?.showGameScene()
        }
    }
}
