//
//  GameManager.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

class GameManager {
    // MARK: - Properties
    static let shared = GameManager()
    var score: Int = 0
    var currentLevel: Int = 1
    var timeRemaining: Int = 60

    // MARK: - Game State
    func resetGame() {
        score = 0
        currentLevel = 1
        timeRemaining = 60
    }

    func increaseScore(by points: Int) {
        score += points
    }

    func nextLevel() {
        currentLevel += 1
        timeRemaining += 10 // Add more time for the next level
    }

    func adjustDifficulty() -> (rows: Int, cols: Int) {
        let baseRows = 10
        let baseCols = 10
        let additionalRows = currentLevel * 2
        let additionalCols = currentLevel * 2
        return (baseRows + additionalRows, baseCols + additionalCols)
    }
}
