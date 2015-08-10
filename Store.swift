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
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpTriangle")
    }
    
    func buySquare() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpSquare")
    }
    
    func buyDiamond() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpDiamond")
    }
    
    func buyPentagon() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpPentagon")
    }
    
    func buyStar() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpStar")
    }
    
    func buyGhost() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpGhost")
    }
    
    func buyBundle() {
        MKStoreKit.sharedKit().initiatePaymentRequestForProductWithIdentifier("DoubleUpCharacterBundle")
    }
}