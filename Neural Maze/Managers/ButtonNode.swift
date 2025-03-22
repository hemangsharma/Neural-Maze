//
//  ButtonNode.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class ButtonNode: SKNode {
    // MARK: - Properties
    let label = SKLabelNode(text: "Restart")
    let background = SKShapeNode(rectOf: CGSize(width: 120, height: 50), cornerRadius: 10)

    // MARK: - Initializer
    override init() {
        super.init()
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setupButton() {
        background.fillColor = .red
        background.alpha = 0.8
        addChild(background)

        label.fontName = "Avenir-Bold"
        label.fontSize = 24
        label.fontColor = .white
        label.verticalAlignmentMode = .center
        addChild(label)
    }
}
