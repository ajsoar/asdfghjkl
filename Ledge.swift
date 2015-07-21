//
//  Ledge.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Ledge: CCSprite {
    //weak var ledge: CCNode!
    
    let minimumLedgePositionY: CGFloat = 50
    let maximumLedgePositionY: CGFloat = 250
    
    func setRandomPosition() {
        let randomPrecision : UInt32 = 100
        let random = CGFloat(arc4random_uniform(randomPrecision)) / CGFloat(randomPrecision)
        let range = maximumLedgePositionY - minimumLedgePositionY + random
        position = ccp(positionInPoints.x, minimumLedgePositionY + (random * range))
        
    }
    
}