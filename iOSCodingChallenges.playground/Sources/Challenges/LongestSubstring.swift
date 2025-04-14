public struct LongestSubstring: Challenge {
    public typealias T = String

    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        "\(data) longest substring: \(longestSubstring)"
    }
}

extension LongestSubstring {

    var longestSubstring: String {
        guard data.count > 1 else {
            return data
        }
        
        let data = data.map { String($0) }
        var longest = ""
        var current = ""
        var index = 0
        var letters = [String: Int]()
        
        while index < data.count {
            let letter = data[index]
            if let letterIndex = letters[letter] {
                //  If we find repeated letter -> check if the substring is the longest
                if longest.count < current.count {
                    longest = current
                    print("new longest: \(current)")
                }
                letters = [:]
                //  Start from the index next to the repeated letter
                index = letterIndex + 1
                current = ""
                print("new index: \(index)")
            } else {
                //  If letter is unique in current substring, just append it
                current += letter
                letters[letter] = index
                index += 1
            }
        }
        
        return longest
    }
}
