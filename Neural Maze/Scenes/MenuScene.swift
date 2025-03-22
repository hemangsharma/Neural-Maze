//
//  MenuScene.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .darkGray
        setupUI()
    }

    func setupUI() {
        let titleLabel = SKLabelNode(text: "Neural Maze")
        titleLabel.fontName = "PressStart2P" // Use a retro pixel font
        titleLabel.fontSize = 36
        titleLabel.fontColor = .white
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + 100)
        addChild(titleLabel)

        let startButton = SKLabelNode(text: "Start Game")
        startButton.fontName = "PressStart2P"
        startButton.fontSize = 24
        startButton.fontColor = .white
        startButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        startButton.name = "startButton"
        addChild(startButton)

        let instructionsButton = SKLabelNode(text: "Instructions")
        instructionsButton.fontName = "PressStart2P"
        instructionsButton.fontSize = 24
        instructionsButton.fontColor = .white
        instructionsButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - 100)
        instructionsButton.name = "instructionsButton"
        addChild(instructionsButton)
    }

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
