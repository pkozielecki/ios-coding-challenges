public struct NotMachingBracketsRemove: Challenge {
    public let data: String

    public init(data: String) {
        self.data = data
    }

    public func execute() -> String {
        "\(data) -> \(removeUnmatchedBrackets())"
    }
}

extension NotMachingBracketsRemove {

    func removeUnmatchedBrackets() -> String {
        guard data.count > 0 && (data.contains("(") || data.contains(")")) else {
            return data
        }
        
        //  Assumption: The string contains only () brackets.
        //  Any other bracket type is considered a letter.
        
        var openingBracketsIndexes = [Int]()
        var closingBracketsIndexes = [Int]()
        //  Converting string to array of single-letter strings (easier to manipulate)
        var stringArr = data.split(separator: "").map { String($0) }
        
        for i in 0...stringArr.count-1 {
            let letter = stringArr[i]
            if letter == "(" {
                // Opening bracket - can't tell if it's matched or not.
                openingBracketsIndexes.append(i)
            } else if letter == ")" {
                if openingBracketsIndexes.isEmpty {
                    //  Unmatched closing bracket - to be removed
                    closingBracketsIndexes.append(i)
                } else {
                    //  Matched closing bracket:
                    //  Let's make sure the opening bracket is NOT removed.
                    _ = openingBracketsIndexes.popLast()
                }
            }
        }
        
        //  We have a list of indexes of brackets to remove:
        let joined = openingBracketsIndexes + closingBracketsIndexes
        let indexesOfBracketsToRemove = joined.sorted(by: { $1 < $0 })
        for index in indexesOfBracketsToRemove {
            stringArr.remove(at: index)
        }
        
        return stringArr.joined()
    }
}
