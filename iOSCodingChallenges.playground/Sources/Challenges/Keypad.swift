public struct Keypad: Challenge {
    public let data: [[Int]]
    public let code: [String]

    public init(data: [[Int]], code: String) {
        self.data = data
        self.code = code.map { String($0) }
    }

    public func execute() -> String {
        guard !code.isEmpty else { return "Code is empty!" }
        let coords = getCoordinates()
        let firstLetter = Int(code[0]) ?? 0

        var length = 0
        var currentCoords = coords[firstLetter] ?? (x: 0, y: 0)
        for i in 1...code.count - 1 {
            let digit = Int(code[i]) ?? 0
            let letterCoords = coords[digit] ?? (x: 0, y: 0)
            let diffx = abs(currentCoords.x - letterCoords.x)
            let diffy = abs(currentCoords.y - letterCoords.y)
            length += max(diffx, diffy)
            currentCoords = letterCoords
        }

        return "Total moves for code \(code) is: \(length)"
    }
}

extension Keypad {

    func getCoordinates() -> [Int: (x: Int, y: Int)] {
        var coords = [Int: (x: Int, y: Int)]()
        for y in 0...data.count - 1 {
            let row = data[y]
            for x in 0...row.count - 1 {
                let value = row[x]
                coords[value] = (x: x, y: y)
            }
        }
        return coords
    }
}
