//
//  TileNode.swift
//  Scene Editor Test
//
//  Created by George Ruzek on 4/12/16.
//  Copyright © 2016 Sharp Top Software. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class TileNode: SKNode {
    
    // use the existing "userData" dictionary to store the data from the file
    var tileHeight : NSNumber?
    var tileWidth : NSNumber?
    var drawingArray : NSArray?
    var tilesDictionary : NSDictionary?
    
    init( dictionaryFile : String) {
        super.init()
        NSLog( "TileNode init")
        
        if userData == nil {
            NSLog( "TileNode attempting to load userData from "+dictionaryFile)
            let path = NSBundle.mainBundle().pathForResource(dictionaryFile, ofType: "plist")
            userData = NSMutableDictionary(contentsOfFile: path!)
            
            if userData != nil {
                drawNodes();
            }
        }
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func drawNodes() {
        self.loadNodes()
        
        for item in drawingArray! {
            createNodes(item as! NSDictionary)
        }
    }

    func loadNodes() {
        // plist walk
        
        tileHeight = userData!["tileHeight"] as? NSNumber
        NSLog( "tileHeight \(tileHeight)")
        tileWidth = userData!["tileWidth"] as? NSNumber
        NSLog( "tileWidth \(tileWidth)")
        
        drawingArray = userData!["drawing"] as? NSArray
        NSLog( "\(drawingArray?.count)" )
        
        tilesDictionary = userData!["tiles"] as? NSDictionary
        NSLog( "\(tilesDictionary?.count)" )
        
    }
    
    func createNodes( dictionary : NSDictionary ) {
        // all the code to create the nodes here
    }
    
}
