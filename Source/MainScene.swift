import Foundation

class MainScene: CCNode {
    
    func didLoadFromCCB() {
        OALSimpleAudio.sharedInstance().playBg("StellarDrone.mp3")
        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
    }
    
    func start() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
        OALSimpleAudio.sharedInstance().playEffect("open.wav")
        OALSimpleAudio.sharedInstance().effectsVolume = 0.05
    }
    
    func settings() {
        let scene  = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }

}