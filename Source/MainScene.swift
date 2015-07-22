import Foundation

class MainScene: CCNode {
    
    func start() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
}