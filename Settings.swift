//
//  SettingsScreen.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import Mixpanel

class Settings: CCNode {
    
    weak var circle: CCSprite!
    weak var triangle: CCSprite!
    weak var square: CCSprite!
    weak var diamond: CCSprite!
    weak var pentagon: CCSprite!
    weak var star: CCSprite!
    weak var ghost: CCSprite!
    
    weak var squareForCircle: CCSprite!
    weak var squareForTriangle: CCSprite!
    weak var squareForSquare: CCSprite!
    weak var squareForDiamond: CCSprite!
    weak var squareForPentagon: CCSprite!
    weak var squareForStar: CCSprite!
    weak var squareForGhost: CCSprite!
    
    var unlockCharacter: GameOver!
    
    weak var selectTriangleButton: CCButton!
    weak var selectSquareButton: CCButton!
    weak var selectDiamondButton: CCButton!
    weak var selectPentagonButton: CCButton!
    weak var selectStarButton: CCButton!
    weak var selectGhostButton: CCButton!
    
    weak var triangleLock: CCSprite!
    weak var squareLock: CCSprite!
    weak var diamondLock: CCSprite!
    weak var pentagonLock: CCSprite!
    weak var starLock: CCSprite!
    weak var ghostLock: CCSprite!
    
    weak var tenPoints: CCLabelTTF!
    weak var twentyPoints: CCLabelTTF!
    weak var fortyPoints: CCLabelTTF!
    weak var eightyPoints: CCLabelTTF!
    weak var onehundredsixtyPoints: CCLabelTTF!
    weak var buy: CCLabelTTF!
    

    enum sounds {
        case yesSound
        case noSound
    }
    
    weak var sound: CCSprite!
    weak var mute: CCSprite!
    
    var state: sounds = .yesSound
    
    func didLoadFromCCB() {
        unlockingCharacter()
    }
    
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
    
    func play() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func selectCircle() {
        Gamestate.sharedInstance.characterType = .Circle
        OALSimpleAudio.sharedInstance().playEffect("open.wav")
        OALSimpleAudio.sharedInstance().effectsVolume = 0.05
        squareForCircle.scaleX = 0.4
        squareForCircle.scaleY = 0.4
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func playsClickSound() {
        OALSimpleAudio.sharedInstance().playEffect("open.wav")
        OALSimpleAudio.sharedInstance().effectsVolume = 0.05
    }
    func selectTriangle() {
        
        Gamestate.sharedInstance.characterType = .Triangle
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.4
        squareForTriangle.scaleY = 0.4
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func selectSquare() {
        Gamestate.sharedInstance.characterType = .Square
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.4
        squareForSquare.scaleY = 0.4
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func selectDiamond() {
        Gamestate.sharedInstance.characterType = .Diamond
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.4
        squareForDiamond.scaleY = 0.4
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func selectPentagon() {
        Gamestate.sharedInstance.characterType = .Pentagon
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.4
        squareForPentagon.scaleY = 0.4
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func selectStar() {
        Gamestate.sharedInstance.characterType = .Star
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.4
        squareForStar.scaleY = 0.4
        squareForGhost.scaleX = 0.3
        squareForGhost.scaleY = 0.3
    }
    
    func selectGhost() {
        Gamestate.sharedInstance.characterType = .Ghost
        playsClickSound()
        squareForCircle.scaleX = 0.3
        squareForCircle.scaleY = 0.3
        squareForTriangle.scaleX = 0.3
        squareForTriangle.scaleY = 0.3
        squareForSquare.scaleX = 0.3
        squareForSquare.scaleY = 0.3
        squareForDiamond.scaleX = 0.3
        squareForDiamond.scaleY = 0.3
        squareForPentagon.scaleX = 0.3
        squareForPentagon.scaleY = 0.3
        squareForStar.scaleX = 0.3
        squareForStar.scaleY = 0.3
        squareForGhost.scaleX = 0.4
        squareForGhost.scaleY = 0.4
        
    }
    
    func unlockingCharacter() {
        let defaults = NSUserDefaults.standardUserDefaults()
        var bestScore = defaults.integerForKey("bestScore")
        let unlockTriangle = 10
        let unlockSquare = 20
        let unlockDiamond = 40
        let unlockPentagon = 80
        let unlockStar = 160
        
        if  bestScore >= unlockTriangle {
            selectTriangleButton.visible = true
            triangleLock.visible = false
            tenPoints.visible = false
        }
        
        if bestScore >= unlockSquare {
            selectSquareButton.visible = true
            squareLock.visible = false
            twentyPoints.visible = false
        }
        
        if bestScore >= unlockDiamond {
            selectDiamondButton.visible = true
            diamondLock.visible = false
            fortyPoints.visible = false
        }
        
        if bestScore >= unlockPentagon {
            selectPentagonButton.visible = true
            pentagonLock.visible = false
            eightyPoints.visible = false
        }
        
        if bestScore >= unlockStar {
            selectStarButton.visible = true
            starLock.visible = false
            onehundredsixtyPoints.visible = false
        }
    }
}