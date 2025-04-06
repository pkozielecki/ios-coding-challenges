public struct CountCharacters: Challenge {
    public typealias T = Data

    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public func execute() -> String {
        var count = 0
        for character in data.phrase {
            if character == data.letter {
                count += 1
            }
        }
        return "letter \(data.letter) appeared in \(data.phrase) \(count) times"
    }
}

extension CountCharacters {
    public struct Data: CustomStringConvertible {
        public let phrase: String
        public let letter: Character

        public init(phrase: String, letter: Character) {
            self.phrase = phrase
            self.letter = letter
        }

        public var description: String {
            "phrase: \(phrase), letter: \(letter)"
        }
    }
}
