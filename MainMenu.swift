//
//  MainMenu.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class MainMenu: CCNode {
    
    func start() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
}