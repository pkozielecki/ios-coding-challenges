import Foundation

public struct AlmostPalindrome: Challenge {
    public typealias T = String

    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        let sanitized = removeNonAlphanumericChars(data)
        if isPalindrome(string: sanitized) {
            return "\(data) is valid palindrome!"
        }
        
        var p1 = 0
        var p2 = sanitized.count - 1
        let strArr: [String] = sanitized.map { String($0) }
        
        while p1 < p2 {
            let value1 = strArr[p1]
            let value2 = strArr[p2]
            //  Noticed first difference:
            if value1 != value2 {
                //  Remove characted at p1:
                var candidate = strArr
                candidate.remove(at: p1)
                print("candidateL: \(candidate)")
                if isPalindrome(string: candidate.joined(separator: "")) {
                    //  After removing a letter, check if palindrome
                    return "After removing \(value1) at \(p1), \(sanitized) is a palindrome"
                } else {
                    // If not, try removing letter at at p2:
                    var candidate = strArr
                    candidate.remove(at: p2)
                    print("candidateR: \(candidate)")
                    if isPalindrome(string: candidate.joined(separator: "")) {
                        //  After removing a letter, check if palindrome
                        return "After removing \(value2) at \(p2), \(sanitized) is a palindrome"
                    } else {
                        //  If not a palindrome - there's no way to remove 1 letter and make it a palindrome ;(
                        return "\(data) is NOT an almost-palindrome"
                    }
                }
            } else {
                //  If letters match, continue comapring until indeces converge
                p1 += 1
                p2 -= 1
            }
        }
        
        return "!!! An error, should never get here!"
    }
}

extension AlmostPalindrome {
    
    func isPalindrome(string: String) -> Bool {
        let lowercased = string.lowercased()
        return String(lowercased.reversed()) == lowercased
    }
    
    func removeNonAlphanumericChars(_ input: String) -> String {
        let pattern = "[^a-zA-Z0-9]"
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return input
        }
        let range = NSRange(input.startIndex..., in: input)
        return regex.stringByReplacingMatches(in: input, range: range, withTemplate: "")
    }
}
