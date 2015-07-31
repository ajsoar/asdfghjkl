//
//  Gamestate.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/31/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

enum Shape: String {
    case Circle = "character"
    case Triangle = "triangle"
    case Square = "square"
    case Diamond = "diamond"
    case Pentagon = "pentagon"
    case Star = "star"
    case Ghost = "ghost"
}

class Gamestate {
    static let sharedInstance = Gamestate()
    
    var characterType: Shape = .Circle
}