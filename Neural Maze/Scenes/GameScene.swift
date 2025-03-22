import SpriteKit

class GameScene: SKScene {
    var mazeNode: MazeNode!
    var playerNode: PlayerNode!
    var gameManager = GameManager.shared


    func setupGame() {
        let (rows, cols) = gameManager.adjustDifficulty()
        mazeNode = MazeNode(numRows: rows, numCols: cols, cellSize: 40.0)
        
        // Center the maze on the screen
        let mazeWidth = CGFloat(cols) * mazeNode.cellSize
        let mazeHeight = CGFloat(rows) * mazeNode.cellSize
        mazeNode.position = CGPoint(x: (size.width - mazeWidth) / 2, y: (size.height - mazeHeight) / 2)
        addChild(mazeNode)

        // Add a border around the maze
        let border = SKShapeNode(rect: CGRect(x: -5, y: -5, width: mazeWidth + 10, height: mazeHeight + 10))
        border.strokeColor = .white
        border.lineWidth = 5
        border.position = CGPoint(x: mazeNode.position.x - 5, y: mazeNode.position.y - 5)
        addChild(border)

        playerNode = PlayerNode(size: 20)
        playerNode.position = CGPoint(x: mazeNode.cellSize / 2, y: mazeNode.cellSize / 2)
        mazeNode.addChild(playerNode)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: mazeNode) // Use mazeNode's coordinate system
        let dx = location.x - playerNode.position.x
        let dy = location.y - playerNode.position.y
        let direction: (Int, Int)

        if abs(dx) > abs(dy) {
            direction = (dx > 0 ? 1 : -1, 0)
        } else {
            direction = (0, dy > 0 ? 1 : -1)
        }

        let newX = Int((playerNode.position.x + CGFloat(direction.0) * mazeNode.cellSize) / mazeNode.cellSize)
        let newY = Int((playerNode.position.y + CGFloat(direction.1) * mazeNode.cellSize) / mazeNode.cellSize)

        if newX >= 0, newY >= 0, newX < mazeNode.numCols, newY < mazeNode.numRows, mazeNode.maze[newY][newX] == 0 {
            playerNode.move(to: CGPoint(x: CGFloat(newX) * mazeNode.cellSize + mazeNode.cellSize / 2, y: CGFloat(newY) * mazeNode.cellSize + mazeNode.cellSize / 2), duration: 0.2)
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0) // Dark background
        setupGame()
    }

   
}
