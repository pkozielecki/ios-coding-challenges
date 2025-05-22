public struct CountingIslands: Challenge {
    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    public func execute() -> String {       
        var islandsCount = 0
        var matrix = data
        
        for row in 0 ... matrix.count-1 {
            for column in 0 ... matrix[row].count-1 {
                if matrix[row][column] == 1 {
                    islandsCount += 1
                    clearIsland(matrix: &matrix, row: row, column: column)
                }
            }
        }
        
        return "Islands counted: \(islandsCount)"
    }
}

extension CountingIslands {
    
    func clearIsland(matrix: inout [[Int]], row: Int, column: Int) {
        guard row >= 0 && row < matrix.count
            && column >= 0 && column < matrix[row].count
            && matrix[row][column] == 1
        else {
            return
        }
        
        matrix[row][column] = 0
        for direction in Directions.allCases {
            let modifier = direction.modifications
            let newRow = row + modifier.row
            let newColumn = column + modifier.column
            clearIsland(matrix: &matrix, row: newRow, column: newColumn)
        }
    }
}
