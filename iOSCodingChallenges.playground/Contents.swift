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
]

for challenge in challanges {
    print("&&&&&&&&&& \(challenge.name)")
    print("----- DATA: \(challenge.data)")
    print("----- RESULT: \(challenge.execute())")
    print("--------------------------------------")
}
