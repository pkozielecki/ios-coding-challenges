public struct RemoveDuplicatedLetters: Challenge {
    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        "\(data) afer removing duplicated: \(removeDuplicates())"
    }
}

extension RemoveDuplicatedLetters {

    func removeDuplicates() -> String {
        let set = Set(data)
        return String(set)
    }
}
