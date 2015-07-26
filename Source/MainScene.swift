import Foundation

class MainScene: CCNode {
    
    func start() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func settings() {
        let scene  = CCBReader.loadAsScene("Settings")
        CCDirector.sharedDirector().presentScene(scene)
    }
}