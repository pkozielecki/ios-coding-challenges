public struct RottingOranges: Challenge {
    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    public func execute() -> String {       
        var matrix = data
        var timePassed = 0
        var rottenOranges = [(row: Int, column: Int)]()
        var healthyOranges = [(row: Int, column: Int)]()
        
        /// Finding initial rotten and healthy oranges:
        for row in 0 ... matrix.count-1 {
            for column in 0 ... matrix[row].count-1 {
                if matrix[row][column] == 2 {
                    rottenOranges.append((row: row, column: column))
                } else if matrix[row][column] == 1 {
                    healthyOranges.append((row: row, column: column))
                }
            }
        }
        
        var rottenOrangesAtCurrentLevel = rottenOranges.count
        while !rottenOranges.isEmpty {
            let coord = rottenOranges.removeFirst()
            rotAdjacentOranges(row: coord.row, column: coord.column, queue: &rottenOranges, matrix: &matrix)
            rottenOrangesAtCurrentLevel -= 1
            
            if rottenOrangesAtCurrentLevel == 0 {
                /// When processed all rotten oranges at given level:
                timePassed += 1
                rottenOrangesAtCurrentLevel = rottenOranges.count // Advance level
            }
        }
        
        /// If there are still some healthy oranges left:
        for coord in healthyOranges {
            if matrix[coord.row][coord.column] == 1 {
                return "At least one healthy orange is left at: \(coord)"
            }
        }
        
        return "Time until all oranges rot: \(timePassed)"
    }
}

extension RottingOranges {
    
    func rotAdjacentOranges(row: Int, column: Int, queue: inout [(row: Int, column: Int)], matrix: inout [[Int]]) {
        for direction in Directions.allCases {
            let modifier = direction.modifications
            let newRow = row + modifier.row
            let newColumn = column + modifier.column
            if newRow >= 0 && newRow < matrix.count
                && newColumn >= 0 && newColumn < matrix[newRow].count
                && matrix[newRow][newColumn] == 1 {
                queue.append((row: newRow, column: newColumn))
                matrix[newRow][newColumn] = 2
            }
        }
    }
}
