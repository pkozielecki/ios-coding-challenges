import Foundation

public struct WallsAndGates: Challenge {
    public typealias T = [[Int]]

    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    public func execute() -> String {
        var matrix = data

        for row in 0...matrix.count - 1 {
            for column in 0...matrix[row].count - 1 {
                if matrix[row][column] == ArrayValues.Gate.rawValue {
                    //  Found a gate, start tracking distance to each room:
                    markDistance(matrix: &matrix, row: row, column: column, distance: 0)
                }
            }
        }

        return "Distance to the room from the nearest gate: \(matrix)"
    }
}

extension WallsAndGates {

    func markDistance(matrix: inout [[Int]], row: Int, column: Int, distance: Int) {
        guard row >= 0 && row < matrix.count
                && column >= 0 && column < matrix[row].count
                && matrix[row][column] >= distance // If room is closer to other gate than the cuttent one!
        else {
            return
        }
        
        //  Write current smallest distance to the room.
        matrix[row][column] = distance

        for direction in Directions.allCases {
            let modifier = direction.modifications
            let newRow = row + modifier.row
            let newColumn = column + modifier.column
            //  Spread out to all directions:
            markDistance(matrix: &matrix, row: newRow, column: newColumn, distance: distance + 1)
        }
    }
}
