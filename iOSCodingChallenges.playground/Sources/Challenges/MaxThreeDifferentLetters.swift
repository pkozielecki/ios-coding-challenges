public struct MaxThreeDifferentLetters: Challenge {
    public typealias T = [String]

    public let data: [String]

    public init(data: [String]) {
        self.data = data
    }

    public func execute() -> String {
        "\(data[0]) and \(data[1]) \(hasMaxThreeDifferentLetters())"
    }
}

extension MaxThreeDifferentLetters {

    func hasMaxThreeDifferentLetters() -> Bool {
        guard data.count == 2, data[0].count == data[1].count else {
            return false
        }

        let reference = data[0].sorted()
        let candidate = data[1].sorted()

        var differentLetters = 0
        for (index, character) in reference.enumerated() {
            if candidate[index] != character {
                differentLetters += 1
                if differentLetters > 3 {
                    return false
                }
            }
        }

        return true
    }
}
