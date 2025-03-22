import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameScene: SKScene {
    var mazeNode: MazeNode!
    var playerNode: PlayerNode!
    var gameManager = GameManager.shared

    override func didMove(to view: SKView) {
        backgroundColor = .black
        setupGame()
    }

    func setupGame() {
        let (rows, cols) = gameManager.adjustDifficulty()
        mazeNode = MazeNode(numRows: rows, numCols: cols, cellSize: 40.0)
        mazeNode.position = CGPoint(x: size.width / 2 - CGFloat(cols) * 20, y: size.height / 2 - CGFloat(rows) * 20)
        addChild(mazeNode)

        playerNode = PlayerNode(size: 20)
        playerNode.position = CGPoint(x: mazeNode.cellSize / 2, y: mazeNode.cellSize / 2)
        addChild(playerNode)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Handle player movement
    }
}
