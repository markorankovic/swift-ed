


import SpriteKit
let view = SKView(frame: .init(x: 0, y: 0, width: 500, height: 500))
view.showsFPS = true

let scene = SKScene(size: view.bounds.size)
scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
scene.backgroundColor = .blue
scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)
view.presentScene(scene)
import PlaygroundSupport
PlaygroundPage.current.liveView = view

for _ in 0..<100 {
    scene.addChild(
        { () -> SKShapeNode in
            let r = CGFloat(10)
            let node = SKShapeNode(circleOfRadius: r)
            node.position = CGPoint(
                x: Int(arc4random_uniform(600)) - 300,
                y: 0
            )
            node.fillColor = SKColor(
                red: CGFloat(arc4random_uniform(255)),
                green: CGFloat(arc4random_uniform(100)),
                blue: CGFloat(arc4random_uniform(255)),
                alpha: 1
            )
            
            let field = SKFieldNode.radialGravityField()
            
            DispatchQueue.main.async(every: 5) { _ in
                if CGFloat.random < 0.1 {
                    field.isEnabled = true
                    field.strength = .random ? -0.025 : 0.05
                    field.physicsBody?.isDynamic = false
                } else {
                    field.isEnabled = false
                    field.physicsBody?.isDynamic = true
                }
                return true
            }

            node.strokeColor = .black
            node.physicsBody = SKPhysicsBody(circleOfRadius: r)
            node.addChild(field)
            return node
        }()
    )
}

extension DispatchQueue {
    
    func async(every t: TimeInterval, closure: @escaping (Int) -> (Bool)) {
        async(every: t, i: 0, closure: closure)
    }
    
    private func async(every t: TimeInterval, i: Int, closure: @escaping (Int) -> (Bool)) {
        asyncAfter(deadline: .now() + t) { [weak self] in
            if closure(i) {
                self?.async(every: t, i: i + 1, closure: closure)
            }
        }
    }
}

extension Bool {
    static var random: Bool { return arc4random_uniform(2) == 1 }
}

extension CGFloat {
    static var random: CGFloat { return CGFloat(arc4random()) / CGFloat(UInt32.max) }
}

