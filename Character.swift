//
//  Character.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Character: CCSprite {
    
    enum CharacterState {
        case Idle
        case JumpedOnce
        case JumpedTwice
    }
    
    var state: CharacterState = .Idle
    
    func jump() {
//        self.physicsBody.applyImpulse(ccp(0,900))
        self.physicsBody.velocity.y = 500
    }
}