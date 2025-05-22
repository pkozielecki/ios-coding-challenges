import Foundation

public struct BinaryTreeRightNodes: Challenge {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
        var visibleNodes = [Int]()

        //  Initial node:
        visibleNodes.append(data.value)
        if let right = data.right {
            exploreRightNodes(node: right, array: &visibleNodes, level: 1)
        }
        if let left = data.left {
            exploreRightNodes(node: left, array: &visibleNodes, level: 1)
        }

        return "Right Nodes: \(visibleNodes)"
    }
}

extension BinaryTreeRightNodes {

    func exploreRightNodes(node: Data, array: inout [Int], level: Int) {
        //  If array at this level is not yet set, append right-most node's value.
        if array.count < level {
            array.append(node.value)
        }
        //  Go right node first:
        if let right = node.right {
            exploreRightNodes(node: right, array: &array, level: level + 1)
        }
        //  Then left node:
        if let left = node.left {
            exploreRightNodes(node: left, array: &array, level: level + 1)
        }
    }

    public class Data: CustomStringConvertible {
        public let left: BinaryTreeRightNodes.Data?
        public let right: BinaryTreeRightNodes.Data?
        public let value: Int

        public init(
            left: BinaryTreeRightNodes.Data?,
            right: BinaryTreeRightNodes.Data?,
            value: Int
        ) {
            self.left = left
            self.right = right
            self.value = value
        }

        public var description: String {
            return "Node: \(value), Left: \(left), Right: \(left)"
        }
    }
}
