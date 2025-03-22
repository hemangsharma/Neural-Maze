//
//  GameManager.swift
//  Neural Maze
//
//  Created by Hemang Sharma on 22/03/2025.
//

class GameManager {
    static let shared = GameManager()
    var score: Int = 0
    var currentLevel: Int = 1
    var timeRemaining: Int = 60

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
        timeRemaining += 10
    }

    func adjustDifficulty() -> (rows: Int, cols: Int) {
        let baseRows = 10
        let baseCols = 10
        let additionalRows = currentLevel * 2
        let additionalCols = currentLevel * 2
        return (baseRows + additionalRows, baseCols + additionalCols)
    }
}
