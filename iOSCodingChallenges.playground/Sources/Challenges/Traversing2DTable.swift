public struct Traversing2DTable: Challenge {
    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    public func execute() -> String {
        var values = [Int]()
        var visited = [[Bool]]()
        data.forEach { _ in
            visited.append(Array(repeating: false, count: data[0].count))
        }
        traverse(
            matrix: data, row: 0, column: 0, visited: &visited, values: &values)
        return "Recorded values: \(values)"
    }
}

extension Traversing2DTable {

    func traverse(matrix: [[Int]], row: Int, column: Int, visited: inout [[Bool]], values: inout [Int]) {
        guard
            row >= 0 && row < matrix.count
                && column >= 0 && column < matrix[0].count
                && visited[row][column] == false
        else {
            return
        }

        visited[row][column] = true
        values.append(matrix[row][column])

        for direction in Directions.allCases {
            let modifications = direction.modifications
            let newRow = row + modifications.row
            let newColumn = column + modifications.column
            traverse(
                matrix: matrix, row: newRow, column: newColumn,
                visited: &visited, values: &values)
        }
    }
}
