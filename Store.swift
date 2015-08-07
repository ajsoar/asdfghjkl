//
//  Store.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Store: CCNode {
    
    func back() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func play() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func buyTriangle() {
        
    }
    
    func buySquare() {
        
    }
    
    func buyDiamond() {
        
    }
    
    func buyPentagon() {
        
    }
    
    func buyStar() {
        
    }
    
    func buyGhost() {
        
    }
    
    func buyBundle() {
        
    }
}