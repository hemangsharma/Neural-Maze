//
//  JoystickNode.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class JoystickNode: SKNode {
    // MARK: - Properties
    let base = SKShapeNode(circleOfRadius: 50)
    let stick = SKShapeNode(circleOfRadius: 25)
    var isActive = false
    var direction: CGPoint = .zero

    // MARK: - Initializer
    override init() {
        super.init()
        setupJoystick()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setupJoystick() {
        base.fillColor = .gray
        base.alpha = 0.5
        addChild(base)

        stick.fillColor = .white
        stick.alpha = 0.5
        addChild(stick)
    }

    // MARK: - Touch Handling
    func updatePosition(for touch: UITouch) {
        let location = touch.location(in: self)
        let distance = sqrt(pow(location.x, 2) + pow(location.y, 2))

        if distance <= 50 {
            stick.position = location
        } else {
            stick.position = CGPoint(x: location.x / distance * 50, y: location.y / distance * 50)
        }

        direction = CGPoint(x: stick.position.x / 50, y: stick.position.y / 50)
    }

    func reset() {
        stick.position = .zero
        direction = .zero
    }
}
