//
//  GameplaySceneClass.swift
//  BunnyJump
//
//  Created by Ibrahim Ali on 23/11/2017.
//  Copyright © 2017 Ibrahim Ali. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameplaySceneClass: SKScene {
    
    var ground = SKSpriteNode()
    
    var player: SKSpriteNode?
    
    var ableToJump = true
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        player = self.childNode(withName: "Player1") as? SKSpriteNode
        
        createGrounds()
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        moveGrounds()
        
        if player?.physicsBody?.velocity.dy == 0 {
            ableToJump = true
        }
        else {
            ableToJump = false
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
    }
    
    func touchDown(atPoint pos: CGPoint) {

        if ableToJump == true {
            jump()
        }
        
    }
    
    func jump() {
        

        player?.texture = SKTexture(imageNamed: "bunny2.png")
        player?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        
        
    }
    
    func touchUp(atPoint pos: CGPoint) {
        player?.texture = SKTexture(imageNamed: "bunny1.png")
    }

    
    
    
    func createGrounds() {
        
        for i in 0...3 {
            
            let ground = SKSpriteNode(imageNamed: "ground.png")
            ground.name = "Ground"
            ground.size = CGSize(width: (self.scene?.size.width)!, height: 250)
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
            
            self.addChild(ground)
            
        }
        
    }
    
    func moveGrounds() {
        
        self.enumerateChildNodes(withName: "Ground", using: ({
            (node, error) in
            
            node.position.x -= 3
            
            if node.position.x < (-(self.scene?.size.width)!) {
                
                node.position.x += (self.scene?.size.width)! * 3
            }
            
            }))
    }
    
}
