//
//  PlayerNode.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class PlayerNode: SKShapeNode {
    // MARK: - Initializer
    init(size: CGFloat) {
        super.init()
        self.path = CGPath(ellipseIn: CGRect(x: -size / 2, y: -size / 2, width: size, height: size), transform: nil)
        self.fillColor = .blue
        self.strokeColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Movement
    func move(to direction: CGPoint, duration: TimeInterval) {
        let moveAction = SKAction.move(to: direction, duration: duration)
        self.run(moveAction)
    }
}
