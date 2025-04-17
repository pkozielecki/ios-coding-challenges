import Foundation

public struct LinkedListDetectCycles: Challenge {
    public typealias T = Data

    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
        guard data.next != nil else {
            return "List is not cycled"
        }

        var seenNodes = [Int: Data]()
        var currentNode: Data? = data

        while currentNode?.next != nil {
            let next = currentNode!.next!
            let value = next.value
            if seenNodes[value] != nil {
                return "List is cycled at: \(value)"
            } else {
                seenNodes[value] = next
                currentNode = next
            }
        }

        return "List is not cycled"
    }
}

extension LinkedListDetectCycles {
    public class Data: CustomStringConvertible {
        public var value: Int
        public var next: LinkedListDetectCycles.Data?

        public init(value: Int, next: LinkedListDetectCycles.Data?) {
            self.value = value
            self.next = next
        }

        public var description: String {
            //  Can't print the list as it might be cycled -> infinite loop.
            return "linked list head: \(value), next: \(next?.value)"
        }

        public static func make(count: Int) -> Data? {
            var lastLink: Data?
            for i in stride(from: count, through: 1, by: -1) {
                lastLink = Data(value: i, next: lastLink)
            }
            return lastLink
        }

        public static func makeCycledList() -> Data? {
            let head = make(count: 4)
            head?.next?.next?.next = head?.next
            return head
        }
    }
}
