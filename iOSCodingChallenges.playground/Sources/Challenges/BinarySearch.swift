import Foundation

public struct BinarySearch: Challenge {
    public typealias T = [Int]

    public let data: [Int]
    public let target: Int

    public init(data: [Int], target: Int) {
        self.data = data
        self.target = target
    }

    public func execute() -> String {
        if let index = search(array: data, target: target, indexShift: 0) {
            return "Target found at: \(index)"
        } else {
            return "Target not found"
        }
    }
}

extension BinarySearch {

    func search(array: [Int], target: Int, indexShift: Int) -> Int? {
        guard !array.isEmpty else { return nil }
        
        let mid = (array.count - 1) / 2
        let midValue = array[mid]
        
        if midValue == target {
            return mid + indexShift
        } else if midValue < target {
            // Search right half, shift index by mid + 1
            return search(array: Array(array[(mid + 1)...]), target: target, indexShift: indexShift + mid + 1)
        } else {
            // Search left half, no index shift
            return search(array: Array(array[..<mid]), target: target, indexShift: indexShift)
        }
    }
}
