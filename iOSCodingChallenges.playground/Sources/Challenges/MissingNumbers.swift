import Foundation

public struct MissingNumbers: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        return "Missing numbers: \(missingNumbers)"
    }
}

extension MissingNumbers {

    fileprivate var missingNumbers: [Int] {
        let sorted = Set(data.sorted())
        let reference = Set(Array(0...100))
        return Array(reference.subtracting(sorted)).sorted()
    }
}
