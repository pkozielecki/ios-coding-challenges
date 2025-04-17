import Foundation

public struct LinkedList: Challenge {
    public typealias T = Data

    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
        var currentNode = data
        //  This will be the tail of reversed list:
        var reversedNode = Data.init(value: data.value, next: nil)
        while currentNode.next != nil {
            let next = currentNode.next!
            //  Take next node's value and linked it with the previous node
            reversedNode = LinkedList.Data(value: next.value, next: reversedNode)
            currentNode = next
        }
        return "reversed node: \(reversedNode.description)"
    }
}

extension LinkedList {
    public class Data: CustomStringConvertible {
        public let value: Int
        public let next: LinkedList.Data?

        public init(value: Int, next: LinkedList.Data?) {
            self.value = value
            self.next = next
        }

        public var description: String {
            var log = "\(value)"
            var current: Data? = self
            while current?.next != nil {
                log += " -> \(current!.next!.value)"
                current = current?.next
            }
            return "linked list values: \(log)"
        }

        public static func make(count: Int) -> Data? {
            var lastLink: Data?
            for i in stride(from: count, through: 1, by: -1) {
                lastLink = Data(value: i, next: lastLink)
            }
            return lastLink
        }
    }
}
