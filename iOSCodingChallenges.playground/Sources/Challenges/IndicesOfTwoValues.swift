import Foundation

public struct IndicesOfTwoValues: Challenge {
    public typealias T = Data

    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
//        return "Indices: \(indicesIndexOf)"
        return "Indices: \(indicesDiscionary)"
    }
}

extension IndicesOfTwoValues {

    fileprivate var indicesIndexOf: [Int] {
        let values = data.array
        let target = data.sum
        guard data.array.count >= 2 else {
            return []
        }
        
        for p1 in 0...values.count - 2 {
            let missingValue = target - values[p1]
            let restOfValues = values[p1+1...values.count-1]
            if let p2 = restOfValues.firstIndex(where: { $0 == missingValue }) {
                return [p1, p2]
            }
        }
        return []
    }
    
    fileprivate var indicesDiscionary: [Int] {
        let values = data.array
        let target = data.sum
        guard data.array.count >= 2 else {
            return []
        }
        
        var tempDict: [Int: Int] = [:]
        for p1 in 0...values.count - 2 {
            let missingValue = target - values[p1]
            let p2 = p1 + 1
            let p2Value = values[p2]
            
            if p2Value == missingValue {
                return [p1, p2]
            } else if let index = tempDict[missingValue] {
                return [p1, index]
            } else {
                tempDict[missingValue] = p2
            }
        }
        return []
    }
}

extension IndicesOfTwoValues {
    
    public struct Data: CustomStringConvertible {
        public let array: [Int]
        public let sum: Int
        
        public init(array: [Int], sum: Int) {
            self.array = array
            self.sum = sum
        }
        
        public var description: String {
            "array: \(array), sum: \(sum)"
        }
    }
}
