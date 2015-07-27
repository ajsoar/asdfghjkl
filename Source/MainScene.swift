import Foundation

class MainScene: CCNode {
    
    func didLoadFromCCB() {
        OALSimpleAudio.sharedInstance().playBg("Resources/Stellardrone - Blinking Star.mp3", loop: true)
//        OALSimpleAudio.sharedInstance().preloadBg("Resources/Stellardrone - Blinking Star.mp3")
//        OALSimpleAudio.sharedInstance().playBgWithLoop(true)
    }
    
    func start() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func settings() {
        let scene  = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }
}