import Foundation

public struct FindMedian: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        return "Median: \(median)"
    }
}

extension FindMedian {

    fileprivate var median: Double {
        guard !data.isEmpty else { return 0 }
        let sorted = data.sorted()
        if data.count % 2 > 0 {
            return Double(sorted[data.count / 2])
        } else {
            let index = data.count / 2
            let leftIndex = index - 1
            return Double(sorted[Int(leftIndex)] + sorted[Int(index)]) / 2
        }
    }
}
