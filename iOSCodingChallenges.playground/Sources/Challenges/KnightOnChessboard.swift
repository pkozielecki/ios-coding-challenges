import Foundation

public struct KnightOnChessboard: Challenge {
    private let N, k, startRow, startColumn: Int

    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
        self.N = data[0]
        self.k = data[1]
        self.startRow = data[2]
        self.startColumn = data[3]
    }

    public func execute() -> String {
        if N < 3 {
            return "Charssboard too small"
        }

        let probability = knightProb(k: k, row: startRow, column: startColumn)
        return
            "Probabillity that knight located at \(startRow), \(startColumn) will remain on \(N)x\(N) chessboard in \(k) moves: \(probability)"
    }
}

extension KnightOnChessboard {

    func knightProb(k: Int, row: Int, column: Int) -> Double {
        if row < 0 || row >= N || column < 0 || column >= N {
            return 0
        }

        if k == 0 {
            return 1
        }

        var sum = 0.0
        for direction in Directions.allCases {
            let newRow = row + direction.row
            let newColumn = column + direction.column
            let moveProb = knightProb(k: k - 1, row: newRow, column: newColumn) / 8
            sum += moveProb
        }
        return sum
    }

    enum Directions: CaseIterable {
        case topLeft, topRight, leftTop, leftBottom, rightTop, rightBottom,
            bottomLeft, bottomRight

        var column: Int {
            switch self {
            case .topLeft, .bottomLeft:
                return -1
            case .topRight, .bottomRight:
                return 1
            case .leftBottom, .leftTop:
                return -2
            case .rightBottom, .rightTop:
                return 2
            }
        }

        var row: Int {
            switch self {
            case .topLeft, .topRight:
                return -2
            case .bottomLeft, .bottomRight:
                return 2
            case .leftBottom, .rightBottom:
                return 1
            case .rightTop, .leftTop:
                return -1
            }
        }
    }
}
