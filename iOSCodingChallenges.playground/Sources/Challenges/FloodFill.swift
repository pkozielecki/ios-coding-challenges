public struct FloodFill: Challenge {
    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    public func execute() -> String {       
        var floodFillCount = 0
        var matrix = data
        
        for row in 0 ... matrix.count-1 {
            for column in 0 ... matrix[row].count-1 {
                if matrix[row][column] > 0 {
                    floodFillCount += 1
                    clearArea(matrix: &matrix, row: row, column: column, value: data[row][column])
                }
            }
        }
        
        return "Flood fills necessery: \(floodFillCount)"
    }
}

extension FloodFill {
    
    func clearArea(matrix: inout [[Int]], row: Int, column: Int, value: Int) {
        guard row >= 0 && row < matrix.count
            && column >= 0 && column < matrix[row].count
            && matrix[row][column] == value
        else {
            return
        }
        
        matrix[row][column] = 0
        for direction in Directions.allCases {
            let modifier = direction.modifications
            let newRow = row + modifier.row
            let newColumn = column + modifier.column
            clearArea(matrix: &matrix, row: newRow, column: newColumn, value: value)
        }
    }
}
