import Foundation

public struct BinaryTreeDepth: Challenge {
    public typealias T = Data

    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
        return "Max depth: \(getDepth(node: data, currentDepth: 1))"
    }
}

extension BinaryTreeDepth {
    
    func getDepth(node: Data?, currentDepth: Int) -> Int {
        if node?.left == nil && node?.right == nil { return currentDepth }
        
        return max(
            getDepth(node: node?.left, currentDepth: currentDepth + 1),
            getDepth(node: node?.right, currentDepth: currentDepth + 1)
        )
    }
    
    public class Data: CustomStringConvertible {
        public let left: BinaryTreeDepth.Data?
        public let right: BinaryTreeDepth.Data?

        public init(left: BinaryTreeDepth.Data?, right: BinaryTreeDepth.Data?) {
            self.left = left
            self.right = right
        }
        
        public var description: String {
            return "Left: \(left) Right: \(left)"
        }
    }
}
