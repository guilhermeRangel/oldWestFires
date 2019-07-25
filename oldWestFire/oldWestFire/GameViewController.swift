
//  GameViewController.swift
//  escapeRun
//
//  Created by Guilherme Rangel on 24/07/19.
//  Copyright © 2019 Guilherme Rangel. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var scene:GameScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        scene?.scaleMode = .aspectFit
        skView.presentScene(scene)
        
    }
    
}
