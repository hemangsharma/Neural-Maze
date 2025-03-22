//
//  MenuScene.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class MenuScene: SKScene {
    // MARK: - Lifecycle
    override func didMove(to view: SKView) {
        backgroundColor = .darkGray
        setupUI()
    }

    // MARK: - UI Setup
    func setupUI() {
        let titleLabel = SKLabelNode(text: "Neural Maze")
        titleLabel.fontName = "Avenir-Bold"
        titleLabel.fontSize = 48
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + 100)
        addChild(titleLabel)

        let startButton = SKLabelNode(text: "Start Game")
        startButton.fontName = "Avenir-Bold"
        startButton.fontSize = 32
        startButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        startButton.name = "startButton"
        addChild(startButton)

        let instructionsButton = SKLabelNode(text: "Instructions")
        instructionsButton.fontName = "Avenir-Bold"
        instructionsButton.fontSize = 32
        instructionsButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - 100)
        instructionsButton.name = "instructionsButton"
        addChild(instructionsButton)
    }

    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let nodes = self.nodes(at: location)

        for node in nodes {
            if node.name == "startButton" {
                let gameScene = GameScene(size: self.size)
                gameScene.scaleMode = .aspectFill
                self.view?.presentScene(gameScene, transition: SKTransition.fade(withDuration: 0.5))
            } else if node.name == "instructionsButton" {
                showInstructions()
            }
        }
    }

    func showInstructions() {
        let instructionsLabel = SKLabelNode(text: "Swipe to move the player. Reach the green exit to win!")
        instructionsLabel.fontName = "Avenir-Bold"
        instructionsLabel.fontSize = 24
        instructionsLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 - 200)
        addChild(instructionsLabel)
    }
}
