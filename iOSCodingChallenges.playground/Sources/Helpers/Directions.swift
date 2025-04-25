import Foundation

public enum Directions: Equatable, CaseIterable {
    case up, right, left, down

    public var modifications: (row: Int, column: Int) {
        switch self {
        case .up:
            (row: -1, column: 0)
        case .right:
            (row: 0, column: 1)
        case .down:
            (row: 1, column: 0)
        case .left:
            (row: 0, column: -1)
        }
    }
}
