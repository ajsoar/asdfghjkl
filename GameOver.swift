//
//  GameOver.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GameOver: CCNode {

    weak var yourScoreNumber: CCLabelTTF!
    weak var bestScoreNumber: CCLabelTTF!
    var score: Int = 0 {
        didSet {
            yourScoreNumber.string = "\(score)"
        }
    }
    
    func didLoadFromCCB() {
        updateBestScore()
        OALSimpleAudio.sharedInstance().playEffect("thud.mp3")
        OALSimpleAudio.sharedInstance().effectsVolume = 0.5
    }
    
    func updateBestScore() {
        var newBestScore = NSUserDefaults.standardUserDefaults().integerForKey("bestScore")
        bestScoreNumber.string = "\(newBestScore)"
    }
    
    override func update(delta: CCTime) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var currentBestScore = defaults.integerForKey("bestScore")
        var currentScore = defaults.integerForKey("yourScore")
        bestScoreNumber.string = "\(currentBestScore)"
    }
    
    //restart game
    func restart () {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    // bring back to Main Menu screen
    func mainMenu() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    
}