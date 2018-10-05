//
//  MainMenuScene.swift
//  BunnyJump
//
//  Created by Ibrahim Ali on 23/11/2017.
//  Copyright © 2017 Ibrahim Ali. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "Start" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition:
                        SKTransition.doorsOpenVertical(withDuration: 1));
                    
                }
            }
            
        }
    }
    
    

}
