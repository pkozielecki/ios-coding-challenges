public struct Palindrome: Challenge {
    public typealias T = String

    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        let lowercased = data.lowercased()
        let result = String(lowercased.reversed()) == lowercased
        return "\(data) is palindrome: \(result)"
    }
}
