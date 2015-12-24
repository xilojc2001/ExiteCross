//
//  GameScene.swift
//  ExiteCross
//
//  Created by Jorge Castro on 11/23/15.
//  Copyright (c) 2015 Xilo. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // En esta seccion se colocan los botones que se van a utilizar inicialmente
    let playButton = SKSpriteNode (imageNamed: "buttonPlay")
    
    // En este metodo se adiciona el boton (imagen) a la pantalla y se establece el color fondo
    override func didMoveToView(view: SKView) {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.playButton)
        self.backgroundColor = UIColor(hex: 0x8C8E90)
        
     
    }
    
    // En esta seccion se establece el comportamiento de los botones
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch : AnyObject in touches{
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == self.playButton{
                let scene = PlayScene(size: self.size)
                scene.scaleMode = .AspectFill
                view!.presentScene(scene)
            }
        }
      
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
