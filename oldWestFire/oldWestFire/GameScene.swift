

//
//  GameScene.swift
//  escapeRun
//
//  Created by Guilherme Rangel on 24/07/19.
//  Copyright © 2019 Guilherme Rangel. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    let map = SKSpriteNode(imageNamed: "map")
    var enemy = SKSpriteNode(imageNamed: "enemy01")
    let friend = SKSpriteNode(imageNamed: "aliado")
    let gunSkin = SKSpriteNode(imageNamed: "gun")
    let posteEsq = SKSpriteNode(imageNamed: "poste00")
    let posteMeio = SKSpriteNode(imageNamed: "poste00")
    let posteDir = SKSpriteNode(imageNamed: "poste00")
    let innocent = SKSpriteNode(imageNamed: "cowboyGirl")
     let gunfireSound = SKAudioNode(fileNamed: "Gunfire")
    
    let animateGunSkin: [SKTexture] = [SKTexture(imageNamed: "gunBang.png"),SKTexture(imageNamed: "gunBang2.png")]
    override func didMove(to view: SKView) {
        
       initActions()
        
    }
    
    func initActions(){
        createMap()
        createPlayer()
        createThings()
        moobPosition()
        createEnemy()
        createFriend()
        createInnocent()
    }
    
    func createInnocent(){
        innocent.anchorPoint = .zero
        innocent.name = "innocent"
        innocent.size = CGSize(width: 200, height: 200)
        innocent.position = CGPoint(x: size.width * 0.65, y: size.height * 0.15)
        innocent.zPosition = 5
        addChild(innocent)
        innocent.isHidden = true
    }
    
    func createThings(){
        
        //copy???
        posteEsq.anchorPoint = .zero
        posteEsq.name = "poste00"
        posteEsq.size = CGSize(width: 300, height: 400)
        
        posteMeio.anchorPoint = .zero
        posteMeio.name = "poste00"
        posteMeio.size = CGSize(width: 300, height: 400)
        
        posteDir.anchorPoint = .zero
        posteDir.name = "poste00"
        posteDir.size = CGSize(width: 300, height: 400)
        
        posteEsq.position = CGPoint(x: -200, y: size.height * 0.2)
        posteMeio.position = CGPoint(x: size.width * -200, y: size.height * 0.2)
        posteDir.position = CGPoint(x: size.width * -200, y: size.height * 0.2)
        posteEsq.zPosition = 4
        posteMeio.zPosition = 3
        posteDir.zPosition = 2
        addChild(posteEsq)
        addChild(posteMeio)
        addChild(posteDir)
      
    }
    
    

    func createEnemy(){
       enemy.anchorPoint = .zero
        enemy.name = "enemy00"
        enemy.size = CGSize(width: 200, height: 200)
        enemy.position = CGPoint(x: 450 , y: 150)
        enemy.zPosition = 5
        addChild(enemy)
        enemy.isHidden = true
       
        
    }
    
    func createMap(){
        backgroundColor = SKColor.gray
        map.name = "map"
        map.anchorPoint = .zero
        map.size = CGSize(width: 1024, height: 993)
        map.zPosition = 0
        addChild(map)
    }
    
    func createFriend(){
        friend.anchorPoint = .zero
        friend.name = "fiend00"
        friend.size = CGSize(width: size.width * 0.2, height: 200)
        friend.position = CGPoint(x: size.width * 0.02, y: 220)
        friend.zPosition = 5
        addChild(friend)
        friend.isHidden = true
    }
    
    func createPlayer(){
        
        gunSkin.anchorPoint = .zero
        gunSkin.name = "ginSkin00"
        gunSkin.size = CGSize(width: 400, height: 300)
        gunSkin.position = CGPoint(x: size.width * 0.0, y: size.height * 0.0)
        gunSkin.zPosition = 5
        addChild(gunSkin)
    }
    
    func moobPosition(){

        
        posteEsq.run(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: size.height * 0.2), duration: 1),
                                        SKAction.move(to: CGPoint(x: size.width * 0.03, y: size.height * 0.2), duration: 3)]))
        posteMeio.run(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: size.height * 0.2), duration: 1),
                                        SKAction.move(to: CGPoint(x: size.width * 0.35, y: size.height * 0.1), duration: 4)]))
        posteDir.run(SKAction.sequence([SKAction.move(to: CGPoint(x: -200, y: size.height * 0.2), duration: 1),
                                        SKAction.move(to: CGPoint(x: size.width * 0.65, y: size.height * 0.15), duration: 5)]))
        
        
        let timerFireDouble = Timer.scheduledTimer(withTimeInterval: 7, repeats: false, block: { timer in
            self.enemy.isHidden = false
            self.friend.isHidden = false
            self.innocent.isHidden = false
            
          
        })
  
    }
    
    func animateSoundGunFire(){
     
            gunfireSound.run(SKAction.play())
            
            
      
    }
    
    func animateGunFire() {
//        self.run(SKAction.repeatForever(
//            SKAction.animate(with: self.walkFrames,
//                             timePerFrame: 0.1,
//                             resize: false,
//                             restore: true)))
        
       gunSkin.run(SKAction.animate(with: animateGunSkin, timePerFrame: 0.3, resize: false, restore: true))
        animateSoundGunFire()
    }

    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let location = touches.first?.location(in: self){
            
            print(location)
            
            if (location.x >= enemy.position.x && location.x <= enemy.position.x + 175 ) && (location.y >= enemy.position.y && location.y <= enemy.position.y + 200 ){
                print("bang bang")
                animateGunFire()
            }
            
        }
        
    }
    

 
   
}



