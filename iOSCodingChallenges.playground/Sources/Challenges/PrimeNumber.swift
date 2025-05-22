import Foundation

public struct PrimeNumber: Challenge {
    public let data: Int

    public init(data: Int) {
        self.data = data
    }

    public func execute() -> String {
        return "Number: \(data) is Prime: \(isPrime)"
    }
}

extension PrimeNumber {
    var isPrime: Bool {
        guard data >= 2 else {
            return false
        }
        guard data != 2 else {
            return true
        }

        for i in 2...Int(ceil(sqrt(Double(data)))) {
            if data%i == 0 {
                return false
            }
        }
        
        return true
    }
}
