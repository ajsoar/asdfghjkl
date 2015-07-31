//
//  SettingsScreen.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class SettingsScreen: CCNode {
    
    weak var circle: CCSprite!
    weak var triangle: CCSprite!
    weak var square: CCSprite!
    weak var diamond: CCSprite!
    weak var pentagon: CCSprite!
    weak var star: CCSprite!
    weak var ghost: CCSprite!
    
    enum sounds {
        case yesSound
        case noSound
    }
    
    weak var sound: CCSprite!
    weak var mute: CCSprite!
    
    var state: sounds = .yesSound
    
    func muting() {
        mute.visible = true
        sound.opacity = 0.5
        OALSimpleAudio.sharedInstance().effectsMuted = true
        OALSimpleAudio.sharedInstance().bgMuted = true
    }
    
    func music() {
        mute.visible = false
        sound.opacity = 1.0
        OALSimpleAudio.sharedInstance().effectsMuted = false
        OALSimpleAudio.sharedInstance().bgMuted = false
    }
    
    func muteAndSound() {
        switch (state) {
        case .yesSound:
            music()
            state = .noSound
        case .noSound:
            muting()
            state = .yesSound
        }
    }
    
    func back() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func selectCircle() {
        Gamestate.sharedInstance.characterType = .Circle
    }
    
    func selectTriangle() {
        Gamestate.sharedInstance.characterType = .Triangle
    }
    
    func selectSquare() {
        Gamestate.sharedInstance.characterType = .Square
    }
    
    func selectDiamond() {
        Gamestate.sharedInstance.characterType = .Diamond
    }
    
    func selectPentagon() {
        Gamestate.sharedInstance.characterType = .Pentagon
    }
    
    func selectStar() {
        Gamestate.sharedInstance.characterType = .Star
    }
    
    func selectGhost() {
        Gamestate.sharedInstance.characterType = .Ghost
        
    }
}