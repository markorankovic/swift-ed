

import PlaygroundSupport
import SpriteKit
import Foundation

let view = SKView(
    frame: .init(
        x: 0,
        y: 0,
        width: 500,
        height: 500
    )
)

let scene = SKScene(size: view.bounds.size)
scene.anchorPoint = .init(x: 0.5, y: 0.5)
scene.backgroundColor = .blue

scene.physicsBody = SKPhysicsBody(
    edgeLoopFrom: .init(
        x: -view.bounds.size.width/2,
        y: -view.bounds.size.height/2,
        width: view.bounds.size.width,
        height: view.bounds.size.height
    )
)

view.presentScene(scene)
view.showsFPS = true

PlaygroundPage.current.liveView = view


scene.addChild(
    { () -> SKShapeNode in
        let path = UIBezierPath(
            arcCenter: .init(x: 0, y: -10),
            radius: 200,
            startAngle: -1,
            endAngle: 3,
            clockwise: false
        )
        let shapeNode = SKShapeNode(path: path.cgPath)  
        shapeNode.physicsBody = SKPhysicsBody(edgeLoopFrom: path.cgPath)
        return shapeNode
    }()
)


scene.addChild(
    { () -> SKShapeNode in
        let radius = 50
        let shapeNode = SKShapeNode(circleOfRadius: CGFloat(radius))
        shapeNode.strokeColor = .black
        shapeNode.fillColor = .green
        shapeNode.physicsBody = .init(circleOfRadius: CGFloat(radius))
        shapeNode.physicsBody?.restitution = 1
        shapeNode.position = .init(x: 0, y: 200)
        //let field = SKFieldNode.radialGravityField()
        //shapeNode.addChild(field)
        return shapeNode
    }()
)
