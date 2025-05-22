public struct MachingBrackets: Challenge {
    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        "\(data) has matching brackets: \(hasMatchingBackets(candidate: data))"
    }
}

extension MachingBrackets {

    func hasMatchingBackets(candidate: String) -> Bool {
        guard candidate.count > 0 && candidate.count % 2 == 0 else {
            return false
        }

        let closingBrackets: [Character] = ["]", ">", "}", ")"]
        let matchingBrackets: [Character: Character] = [
            "]": "[",
            ">": "<",
            "}": "{",
            ")": "(",
        ]
        var openedBrackets = [Character]()

        for bracket in data {
            if closingBrackets.contains(bracket) {
                print("   > Closing bracket: \(bracket)")

                //  If we have a closing bracket, check if a matching opening bracket was recorded:
                if let lastOpened = openedBrackets.last,
                    lastOpened == matchingBrackets[bracket]
                {
                    print("   > Matching closing bracket: \(bracket)")
                    _ = openedBrackets.popLast()
                } else {
                    //  If not, we have an unmatched closing bracket:
                    print("   > NOT MATCHING closing bracket: \(bracket)")
                    return false
                }
            } else {
                //  Append opening bracket:
                print("   > Opening bracket: \(bracket)")
                openedBrackets.append(bracket)
            }
        }

        //  Finally check if all opened brackets were closed:
        return openedBrackets.isEmpty
    }
}
