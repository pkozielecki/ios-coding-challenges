public struct Permuations: Challenge {
    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        return "Generated permuations for: \(data) -> \(getPermutations(data).joined(separator: ","))"
    }
}

extension Permuations {

    func getPermutations(_ string: String) -> [String] {
        guard string.count > 1 else {
            return [string]
        }

        var permutations = [String]()
        for (index, letter) in string.enumerated() {
            var remainingLetters = string
            let stringIndex = remainingLetters.index(remainingLetters.startIndex, offsetBy: index)
            remainingLetters.remove(at: stringIndex)

            let subPermutations = getPermutations(String(remainingLetters))

            for subPermutation in subPermutations {
                permutations.append("\(letter)\(subPermutation)")
            }
        }

        return Array(Set(permutations))
    }
}
