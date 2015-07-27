//
//  SettingsScreen.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Settings: CCNode {
    
    enum sounds {
        case yesSound
        case noSound
    }
    
    weak var sound: CCSprite!
    weak var mute: CCSprite!
    
    var state: sounds = .yesSound
    
    func muting() {
        sound.visible = false
        mute.visible = true
    }
    
    func music() {
        sound.visible = true
        mute.visible = false
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
    
    
}