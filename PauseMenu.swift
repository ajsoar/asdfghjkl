//
//  PauseMenu.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/25/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class PauseMenu: CCNode {
    
    func resume() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
}