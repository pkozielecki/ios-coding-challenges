public struct Anagrams: Challenge {
    public typealias T = [String]

    public let data: [String]

    public init(data: [String]) {
        self.data = data
    }

    public func execute() -> String {
        "\(groupAnagrams(candidates: data))"
    }
}

extension Anagrams {

    fileprivate func groupAnagrams(candidates: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for candidate in candidates {
            // Lowercase and sort:
            let transformed = String(candidate.lowercased().sorted())
            if dict[transformed] != nil {
                dict[transformed]?.append(candidate)
            } else {
                dict[transformed] = [candidate]
            }
        }
        return dict.values.map { $0 }
    }
}
