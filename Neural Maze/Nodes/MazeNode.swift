//
//  MazeNode.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

import SpriteKit

class MazeNode: SKNode {
    var maze: [[Int]] = []
    let numRows: Int
    let numCols: Int
    let cellSize: CGFloat

    init(numRows: Int, numCols: Int, cellSize: CGFloat) {
        self.numRows = numRows
        self.numCols = numCols
        self.cellSize = cellSize
        super.init()
        generateMaze()
        drawMaze()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
