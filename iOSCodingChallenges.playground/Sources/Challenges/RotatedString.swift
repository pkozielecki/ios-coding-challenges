public struct RotatedString: Challenge {
    public let data: [String]

    public init(data: [String]) {
        self.data = data
    }

    public func execute() -> String {
        return "Is rotated: \(isRotated)"
    }
}

private extension RotatedString {
    
    var isRotated: Bool {
        let source = data[0].lowercased()
        let candidate = data[1].lowercased()
        guard source.count == candidate.count, source.count > 0 else {
            return false
        }
        return "\(source)\(source)".contains(candidate)
    }
}
