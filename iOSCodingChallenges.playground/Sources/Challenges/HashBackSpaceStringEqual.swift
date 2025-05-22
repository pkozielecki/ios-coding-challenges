public struct HashBackSpaceStringEqual: Challenge {
    public let data: [String]

    public init(data: [String]) {
        self.data = data
    }

    public func execute() -> String {
        "\(data[0]) [decoded into '\(decode(encoded: data[0]))'] and \(data[1]) [decoded into '\(decode(encoded: data[1]))'] -> are equal: \(areEqual)"
    }
}

extension HashBackSpaceStringEqual {

    var areEqual: Bool {
        let first = decode(encoded: data[0])
        let second = decode(encoded: data[1])
        return first == second
    }

    func decode(encoded: String) -> String {
        guard encoded.contains("#") else {
            return encoded
        }

        var decoded = [Character]()
        for letter in encoded {
            if letter == "#" {
                _ = decoded.popLast()
            } else {
                decoded.append(letter)
            }
        }
        return String(decoded)
    }
}
