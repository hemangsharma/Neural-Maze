import SpriteKit
import GameplayKit
//import GoogleMobileAds  // Google Ads for monetization

class GameScene: SKScene {
    let numRows = 15
    let numCols = 15
    let cellSize: CGFloat = 40.0
    var maze: [[Int]] = []
    var player: SKShapeNode!
    var exit: SKShapeNode!
    //var bannerView: BannerView!
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        //setupGoogleAds()
        generateMaze()
        drawMaze()
        setupPlayer()
        setupExit()
    }
    
    func generateMaze() {
        maze = Array(repeating: Array(repeating: 1, count: numCols), count: numRows)
        carveMaze(x: 0, y: 0)
    }
    
    func carveMaze(x: Int, y: Int) {
        maze[y][x] = 0
        let directions = [(0,1), (1,0), (0,-1), (-1,0)].shuffled()
        for (dx, dy) in directions {
            let nx = x + dx * 2, ny = y + dy * 2
            if nx >= 0, ny >= 0, nx < numCols, ny < numRows, maze[ny][nx] == 1 {
                maze[y + dy][x + dx] = 0
                carveMaze(x: nx, y: ny)
            }
        }
    }
    
    func drawMaze() {
        for row in 0..<numRows {
            for col in 0..<numCols {
                let rect = CGRect(x: CGFloat(col) * cellSize, y: CGFloat(row) * cellSize, width: cellSize, height: cellSize)
                let node = SKShapeNode(rect: rect)
                node.strokeColor = .white
                node.fillColor = maze[row][col] == 1 ? .gray : .black
                addChild(node)
            }
        }
    }
    
    func setupPlayer() {
        let startX = cellSize / 2
        let startY = cellSize / 2
        player = SKShapeNode(circleOfRadius: cellSize / 3)
        player.fillColor = .blue
        player.position = CGPoint(x: startX, y: startY)
        addChild(player)
    }
    
    func setupExit() {
        let exitX = CGFloat(numCols - 1) * cellSize + cellSize / 2
        let exitY = CGFloat(numRows - 1) * cellSize + cellSize / 2
        exit = SKShapeNode(circleOfRadius: cellSize / 3)
        exit.fillColor = .green
        exit.position = CGPoint(x: exitX, y: exitY)
        addChild(exit)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let dx = location.x - player.position.x
        let dy = location.y - player.position.y
        let direction: (Int, Int)
        
        if abs(dx) > abs(dy) {
            direction = (dx > 0 ? 1 : -1, 0)
        } else {
            direction = (0, dy > 0 ? 1 : -1)
        }
        
        let newX = Int((player.position.x + CGFloat(direction.0) * cellSize) / cellSize)
        let newY = Int((player.position.y + CGFloat(direction.1) * cellSize) / cellSize)
        
        if newX >= 0, newY >= 0, newX < numCols, newY < numRows, maze[newY][newX] == 0 {
            let moveAction = SKAction.moveBy(x: CGFloat(direction.0) * cellSize, y: CGFloat(direction.1) * cellSize, duration: 0.2)
            player.run(moveAction)
        }
        
        if player.position == exit.position {
            print("You win!")
            restartGame()
        }
    }
    
    func restartGame() {
        removeAllChildren()
        generateMaze()
        drawMaze()
        setupPlayer()
        setupExit()
    }
/*
    func setupGoogleAds() {
        bannerView = BannerView(adSize: AdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-xxxxxxxxxxxxxxxx/xxxxxxxxxx" // Replace with actual AdMob ID
        bannerView.rootViewController = self.view?.window?.rootViewController
        bannerView.load(Request())
        bannerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        self.view?.addSubview(bannerView)
    }*/
}
