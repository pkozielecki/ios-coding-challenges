import Foundation

let challanges: [any Challenge] = [
    Palindrome(data: "rotator"),
    Palindrome(data: "nope"),

    Anagrams(data: ["cat", "tac", "atc", "sun", "Llm", "lml"]),
    Anagrams(data: ["cat", "dog"]),

    MachingBrackets(data: "[{<>}]"),
    MachingBrackets(data: "[{<}>]"),
    MachingBrackets(data: "[{{(<>)}"),
    MachingBrackets(data: "{}<>(){<>()}"),

    CountCharacters(data: .init(phrase: "Aaaabbbc", letter: "a")),
    CountCharacters(data: .init(phrase: "", letter: "a")),

    RotatedString(data: ["abcd", "dabc"]),
    RotatedString(data: ["abcd", "dabcd"]),

    RemoveDuplicatedLetters(data: "aabbcc"),
    RemoveDuplicatedLetters(data: ""),
    
    MaxThreeDifferentLetters(data: ["abc", "abc"]),
    MaxThreeDifferentLetters(data: ["abcd", "dbac"]),
    MaxThreeDifferentLetters(data: ["abcd", "zxab"]),
    MaxThreeDifferentLetters(data: ["abcd", "1234"]),
    
    Permuations(data: "abc"),
    Permuations(data: "aabbcc"),
    
    PrimeNumber(data: 0),
    PrimeNumber(data: 1),
    PrimeNumber(data: 2),
    PrimeNumber(data: 3),
    PrimeNumber(data: 4),
    PrimeNumber(data: 21),
    PrimeNumber(data: 111),
    
    BinaryReverse(data: 32),
    BinaryReverse(data: 128),
    BinaryReverse(data: 1),
    BinaryReverse(data: 0),
    
    MissingNumbers(data: Array(0...99)),
    MissingNumbers(data: [0,1,100]),
    
    FindMedian(data: [1,2,3,5,100]),
    FindMedian(data: [1]),
    FindMedian(data: [1,2]),
    
    BubbleSort(data: [1,2,3,4,5]),
    BubbleSort(data: [5,4,3,2,1]),
    BubbleSort(data: [1,4,60,2,1]),
    
    IndicesOfTwoValues(data: .init(array: [1,2,3,9,4], sum: 13)),
    IndicesOfTwoValues(data: .init(array: [1,2], sum: 3)),
    IndicesOfTwoValues(data: .init(array: [], sum: 3)),
    IndicesOfTwoValues(data: .init(array: [1,2,3], sum: 8)),
    
    LargestContainer(data: [1,2,3,1,4]),
    LargestContainer(data: [1,2]),
    LargestContainer(data: [1]),
    LargestContainer(data: []),
    LargestContainer(data: [0,1,6,7,1,9]),
    
    Rainwater(data: []),
    Rainwater(data: [1]),
    Rainwater(data: [1,2]),
    Rainwater(data: [1,0,3]),
    Rainwater(data: [1,3,2,0,5,4,1,3,7]),
    
    HashBackSpaceStringEqual(data: ["", ""]),
    HashBackSpaceStringEqual(data: ["123#", "12"]),
    HashBackSpaceStringEqual(data: ["###", ""]),
    HashBackSpaceStringEqual(data: ["##  #", ""]),
    
    LongestSubstring(data: ""),
    LongestSubstring(data: "a"),
    LongestSubstring(data: "aa"),
    LongestSubstring(data: "ab"),
    LongestSubstring(data: "abcbda"),
    LongestSubstring(data: "abcccabdc"),
    
    AlmostPalindrome(data: "aba"),
    AlmostPalindrome(data: ""),
    AlmostPalindrome(data: "1"),
    AlmostPalindrome(data: "a ba"),
    AlmostPalindrome(data: "a b %a"),
    AlmostPalindrome(data: "a b %aa"),
    
    LinkedList(data: .make(count: 5)!),
    LinkedList(data: .init(value: 1, next: nil)),
    
    LinkedListDetectCycles(data: .make(count: 1)!),
    LinkedListDetectCycles(data: .make(count: 3)!),
    LinkedListDetectCycles(data: .makeCycledList()!),
    
    NotMachingBracketsRemove(data: ""),
    NotMachingBracketsRemove(data: "()"),
    NotMachingBracketsRemove(data: "(abcd)"),
    NotMachingBracketsRemove(data: ")abcd()"),
    NotMachingBracketsRemove(data: ")))"),
    NotMachingBracketsRemove(data: ")()()"),
    
    QuickSort(data: [1,9,4,7,2,3,6]),
    QuickSort(data: [1]),
    QuickSort(data: []),
    
    BinarySearch(data: [], target: 5),
    BinarySearch(data: [1,2,3], target: 5),
    BinarySearch(data: [1,3,4,5], target: 5),
    BinarySearch(data: [1,3,5,5,5,9,8,11], target: 5),
    
    BinaryTreeDepth(data: .init(left: nil, right: nil)),
    BinaryTreeDepth(data: .init(left: .init(left: nil, right: .init(left: .init(left: nil, right: nil), right: nil)), right: nil)),
    
    Keypad(data: [[1,2,3],[4,5,6],[7,8,9]], code: "123"),
    Keypad(data: [[1,2,3],[4,5,6],[7,8,9]], code: "193"),
    Keypad(data: [[4,8,1],[5,2,6],[9,3,7]], code: "123"),
    Keypad(data: [[4,8,1],[5,2,6],[9,3,7]], code: ""),
    
    BinaryTreeRightNodes(data: .init(left: nil, right: nil, value: 1)),
    BinaryTreeRightNodes(data: .init(
        left: .init(
            left: .init(
                left: .init(
                    left: nil,
                    right: nil,
                    value: 6
                ),
                right: .init(
                    left: nil,
                    right: nil,
                    value: 7 // (*)
                ),
                value: 5
            ),
            right: nil,
            value: 2
        ),
        right: .init(
            left: nil,
            right: .init(
                left: nil,
                right: nil,
                value: 4 // (*)
            ),
            value: 3),
        value: 1)
    ),
    
    
    Traversing2DTable(data: [[1,2,3],[4,5,6],[7,8,9]]),
    
    CountingIslands(data: [[1,1,1],[1,0,0],[1,0,1]]),
    CountingIslands(data: [[0,0,0],[0,0,0],[0,0,0]]),
    CountingIslands(data: [[1,0,0],[0,1,0],[0,0,1]]),
    
    FloodFill(data: [[1,1,1,2,3],[1,2,1,2,3],[1,1,1,2,1]]),
    FloodFill(data: [[1,1,1,1,1],[1,1,1,1,1],[1,1,1,1,1]]),
    FloodFill(data: [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]),
    
    RottingOranges(data: [[2,0,0,0,1],[1,1,0,0,2],[0,1,1,1,1],[0,1,0,0,1]]),
    RottingOranges(data: [[2,0,1,0,1],[1,1,0,0,2],[0,1,1,1,1],[0,1,0,0,1]]),
    
    WallsAndGates(data: [[ArrayValues.Empty.rawValue,ArrayValues.Wall.rawValue,ArrayValues.Gate.rawValue,ArrayValues.Empty.rawValue],[ArrayValues.Empty.rawValue,ArrayValues.Empty.rawValue,ArrayValues.Empty.rawValue,ArrayValues.Wall.rawValue],[ArrayValues.Empty.rawValue,ArrayValues.Wall.rawValue,ArrayValues.Empty.rawValue,ArrayValues.Wall.rawValue],[ArrayValues.Gate.rawValue,ArrayValues.Wall.rawValue,ArrayValues.Empty.rawValue,ArrayValues.Empty.rawValue]]),
    
    KnightOnChessboard(data: [1, 3, 0, 0]),
    KnightOnChessboard(data: [2, 3, 0, 0]),
    KnightOnChessboard(data: [5, 3, 2, 2]),
    KnightOnChessboard(data: [5, 1, 4, 4]),
    
    SuccessionLine(data: SuccessionLine.Monarchy(kingName: "John")),
    SuccessionLine(data: {
        let monarchy = SuccessionLine.Monarchy(kingName: "John")
        monarchy.birth(childName: "Peter", parentName: "John")
        monarchy.birth(childName: "Paul", parentName: "Peter")
        monarchy.birth(childName: "Elle", parentName: "John")
        monarchy.death(name: "John")
        monarchy.death(name: "Peter")
        return monarchy
    }()),
    
    ParkingVehicles(data: ParkingVehicles.CarPark(compactSpaces: 0, regularSpaces: 0, largeSpaces: 0)),
    ParkingVehicles(data: {
        var carPark = ParkingVehicles.CarPark(compactSpaces: 2, regularSpaces: 2, largeSpaces: 2)
        carPark.park(.motorCycle)
        carPark.park(.van)
        carPark.park(.car)
        carPark.park(.motorCycle)
        carPark.park(.car)
        carPark.park(.van)
        carPark.park(.van)
        return carPark
    }()),
    ParkingVehicles(data: {
        var carPark = ParkingVehicles.CarPark(compactSpaces: 1, regularSpaces: 1, largeSpaces: 0)
        carPark.park(.motorCycle)
        let reservation = carPark.park(.motorCycle)
        carPark.park(.van)
        carPark.free(reservation!)
        carPark.park(.van)
        carPark.park(.car)
        return carPark
    }()),
]

for challenge in challanges {
    print("&&&&&&&&&& \(challenge.name)")
    print("----- DATA: \(challenge.data)")
    print("----- RESULT: \(challenge.execute())")
    print("--------------------------------------")
}
