//
//  Gameplay.swift
//  asdfghjkl
//
//  Created by Judy Dela Cruz on 7/21/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Gameplay: CCNode, CCPhysicsCollisionDelegate {
    
    weak var character: Character!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var ledgesLayer: CCNode!
    weak var die1: CCNode!
    weak var die2: CCNode!
    weak var ground: CCSprite!
    weak var gameplay: CCNode!
    weak var ledgeForScore: CCSprite!
    
    weak var ceiling1: CCNode!
    weak var ceiling2: CCNode!
    var ceilings = [CCNode]()
    
    weak var pauseButton: CCSprite!
    
    var scrollSpeed: CGFloat = 1.5
    var points: Int = 0
    var gameOver = false
    
    var ledges: [CCNode] = []
    let firstLedgePosition: CGFloat = 360
    let distanceBetweenLedges: CGFloat = 150
    var dies = [CCNode]()
    
    weak var scoreLabel: CCLabelTTF!
    
    weak var pausedTitle: CCLabelTTF!
    weak var retry: CCSprite!
    weak var retryButton: CCSprite!
    weak var home: CCSprite!
    weak var homeButton: CCButton!
    weak var resumeButton: CCButton!
    weak var resumeIcon: CCSprite!
    weak var settings: CCSprite!
    weak var settingsButton: CCButton!
    weak var shop: CCSprite!
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
        pauseButton.visible = true
        //gamePhysicsNode.debugDraw = true
        dies.append(die1)
        dies.append(die2)
        ceilings.append(ceiling1)
        ceilings.append(ceiling2)
        
        die1.physicsBody.sensor = true
        die2.physicsBody.sensor = true
        
        for i in 0...4 {
            spawnNewLedge()
        }
        
        gamePhysicsNode.collisionDelegate = self
        
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        if (gameOver == false) {
            jumpLimit()
            
        }
    }
    
    //movement between world and character
    override func update(currentTime: CFTimeInterval) {

        //sinceTouch += delta
        
        character.position = CGPoint(x: character.position.x + scrollSpeed, y: character.position.y)
        gamePhysicsNode.position = CGPoint(x: gamePhysicsNode.position.x - scrollSpeed, y: gamePhysicsNode.position.y)
        let velocityY = clampf(Float(character.physicsBody.velocity.y), -Float(CGFloat.max), 300)
        character.physicsBody.velocity = ccp(0, CGFloat(velocityY))
        scrollSpeed *= 1.00009
        
        for ledge in ledges.reverse() {
            let ledgeWorldPosition = gamePhysicsNode.convertToWorldSpace(ledge.position)
            let ledgeScreenPosition = convertToNodeSpace(ledgeWorldPosition)
            
            // remove ledges when passing the left part of the screen
            if ledgeScreenPosition.x < (-ledge.contentSize.width) {
                ledge.removeFromParent()
                ledges.removeAtIndex(find(ledges, ledge)!)
                
                spawnNewLedge()
            }
            
        }
        
        //loop for the bottom game over
        for die in dies {
            let dieWorldPosition = gamePhysicsNode.convertToWorldSpace(die.position)
            let dieScreenPosition = convertToNodeSpace(dieWorldPosition)
            if dieScreenPosition.x <= (-die.contentSize.width) {
                die.position = CGPoint(x: die.position.x + scrollSpeed, y: die.position.y)

            }
        }
        
        //loop for the top of the game
        for ceiling in ceilings {
            let ceilingWorldPosition = gamePhysicsNode.convertToWorldSpace(ceiling.position)
            let ceilingScreenPosition = convertToNodeSpace(ceilingWorldPosition)
            if ceilingScreenPosition.x <= (-ceiling.contentSize.width) {
                ceiling.position = CGPoint(x: ceiling.position.x + scrollSpeed, y: ceiling.position.y)
            }
        }
    }
    
    // make a new ledge function
    func spawnNewLedge() {
        var prevLedgePos = firstLedgePosition
        
        if ledges.count > 0 {
            prevLedgePos = ledges.last!.position.x
        }
        
        // create and add a new ledge
        let ledge = CCBReader.load("ledge") as! Ledge
        ledge.position = ccp(prevLedgePos + distanceBetweenLedges, 0)
        ledge.setRandomPosition()
        ledgesLayer.addChild(ledge)
        ledges.append(ledge)
    }
    
    // limits to two jumps
    func jumpLimit() {
        switch (character.state) {
        case .Idle:
            character.jump()
            character.state = .JumpedOnce
        case .JumpedOnce:
            character.jump()
            character.state = .JumpedTwice
        case .JumpedTwice:
            character.fallDown()
//            break
        }
        
    }
    
    func resetJump() {
        character.state = .Idle
    }
    
    //adds score for the whenever the character jumps onto the ledge
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, character: Character!, ledge: Ledge!) -> Bool {
        points++
        scoreLabel.string = String(points)
        resetJump()
        gamePhysicsNode.space.addPostStepBlock({ () -> Void in
            ledge.runAction(CCActionMoveBy(duration: 0.5, position: ccp (0,-300)))
            }, key: ledge)
        
        scoreLabel.visible = true
        ledgeForScore.visible = true
        OALSimpleAudio.sharedInstance().playEffect("sonar.WAV")
        
        return true
    }
    
//    collision of the bottom node for game over and character to trigger the game over
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, character: Character!, dead: CCNode!) -> Bool {
        triggerGameOver()
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, character: Character!, ground: CCSprite!) -> Bool {
        resetJump()
        OALSimpleAudio.sharedInstance().playEffect("sonar.WAV")
        return true
    }
    
    
    //pause game
    func pause() {
        gameplay.paused = true
        pauseButton.visible = false
        resumeButton.visible = true
        resumeIcon.visible = true
        pausedTitle.visible = true
        retry.visible = true
        retryButton.visible = true
        home.visible = true
        homeButton.visible = true
        settings.visible = true
        settingsButton.visible = true
        shop.visible = true

    }
    
    func resume() {
        gameplay.paused = false
        pauseButton.visible = true
        resumeButton.visible = false
        resumeIcon.visible = false
        pausedTitle.visible = false
        retry.visible = false
        retryButton.visible = false
        home.visible = false
        homeButton.visible = false
        settings.visible = false
        settingsButton.visible = false
        shop.visible = false
    }
    
    
    //restart game
    func restart() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func main() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func openSettings() {
        let scene = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    //starts with the gameOver thing
    func triggerGameOver() {
        if (gameOver == false) {
            gameOver = true
            pauseButton.visible = false
            scrollSpeed = 0
            scoreLabel.visible = false
            ledgeForScore.visible = false
            
            character.stopAllActions()
            
            let move = CCActionEaseBounceOut(action: CCActionMoveBy(duration: 0.2, position: ccp(0, 4)))
            let moveBack = CCActionEaseBounceOut(action: move.reverse())
            let shakeSequence = CCActionSequence(array: [move, moveBack])
            runAction(shakeSequence)
        }
        
        
        //gameoverpop appears
        var gameOverPopup = CCBReader.load("GameOver") as! GameOver
        gameOverPopup.positionType = CCPositionType(xUnit: .Normalized, yUnit: .Normalized, corner: .BottomLeft)
        gameOverPopup.position = ccp(0.5, 0.5)
        gameOverPopup.zOrder = Int.max
        addChild(gameOverPopup)
        gameOverPopup.score = points
        
        // best score save
        let defaults = NSUserDefaults.standardUserDefaults()
        var bestScore = defaults.integerForKey("bestScore")
        if self.points > bestScore {
            defaults.setInteger(Int(self.points), forKey: "bestScore")
        }
        
    }
    
}