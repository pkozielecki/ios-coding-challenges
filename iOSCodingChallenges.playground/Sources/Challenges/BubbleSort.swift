import Foundation

public struct BubbleSort: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        return "Sorted: \(sorted)"
    }
}

extension BubbleSort {

    fileprivate var sorted: [Int] {
        var array = data
        for gen in 0...array.count - 1 {
            var hasSwapped = false
            for i in 0...array.count - 2 {
                let first = array[i]
                let second = array[i + 1]
                if second < first {
                    array[i] = second
                    array[i + 1] = first
                    hasSwapped = true
                }
            }
            if !hasSwapped {
                print("Gen: \(gen), no swaps detected - finished sorting")
                return array
            }
        }
        return array
    }
}
