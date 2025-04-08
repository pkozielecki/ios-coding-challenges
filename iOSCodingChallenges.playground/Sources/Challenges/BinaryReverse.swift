import Foundation

public struct BinaryReverse: Challenge {
    public typealias T = Int

    public let data: Int

    public init(data: Int) {
        self.data = data
    }

    public func execute() -> String {
        return
            "Number: \(data) (binary: \(data.binaryString)) -> reversed: \(reversed) (binary: \(reversed.binaryString))"
    }
}

extension BinaryReverse {
    var reversed: Int {
        let binaryString = data.binaryString
        let reversed = String(binaryString.reversed())
        return Int(reversed, radix: 2) ?? data
    }
}

extension Int {
    var binaryString: String {
        let binary = String(self, radix: 2)
        let prefix = String(repeating: "0", count: 8 - binary.count)
        return prefix + binary
    }
}
