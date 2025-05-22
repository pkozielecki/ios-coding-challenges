# Swift Algorithm Challenges

A collection of **common algorithmic challenges implemented in Swift**, written with clean, maintainable code. Perfect for **preparing for coding interviews** or practicing LeetCode/HackerRank problems!

## Project Description

This `Xcode Playground` project offers solutions for various algorithmic challenges - ranging from string manipulation to binary tree operations.

Each challenge is neatly encapsulated in its own struct conforming to a `Challenge` protocol. It allows to conveniently execute new challenges and adding new ones in a structured and readable way:

```swift
public protocol Challenge {
    associatedtype T: CustomStringConvertible

    var name: String { get }
    var data: T { get }

    func execute() -> String
}
```

and:

```swift
public extension Challenge {
    var name: String { String(describing: type(of: self)) }
}
```

## Setup Instructions

1. Clone the repository:
   
   ```bash
   git clone <https://github.com/pkozielecki/ios-coding-challenges>
   ```

2. Open the Xcode Playground:
   
   ```bash
   open iOSCodingChallenges.playground
   ```

3. Run the playground to see the challenges in action.

## How it works

The main `Playground` file creates an array containing instances of different challenges and input data. It then iterates through the list, executing each `Challenge` and printing an answer:

```swift
let challanges: [any Challenge] = [
    Palindrome(data: "rotator"),
    ...

    Anagrams(data: ["cat", "tac", "atc", "sun", "Llm", "lml"]),
    ...

    MachingBrackets(data: "[{<>}]"),
    MachingBrackets(data: "[{<>}]"),
    ...
]

for challenge in challanges {
    print("&&&&&&&&&& \\(challenge.name)")
    print("----- DATA: \\(challenge.data)")
    print("----- RESULT: \\(challenge.execute())")
    print("--------------------------------------")
}
```

## Adding new challenges

To add a new challenge to the list, follow these steps:

1. Create a new object conforming to the `Challenge` protocol.
   Define the associated `Data` type, making sure it conforms to `CustomStringConvertible`:

```swift
public struct My2dMatrixChallenge: Challenge {
    public let data: [[Int]]

    public init(data: [[Int]]) {
        self.data = data
    }

    ...
}
```

1. Implement the `execute()` method, returning the result of the challenge:

```swift
public func execute() -> String {
    /// Solve the challenge.       
    return "And the answer is: ..."
}
```

1. Add your `Challenge` object to the main playground file:

```swift
let challanges: [any Challenge] = [

    ....

    My2dMatrixChallenge(data: [[1,1,1], [2,2,2] ... ]),
]
```

## Implemented Challenges

### String Manipulation

- **Palindrome**:
  Checks if a string is a palindrome. [Palindrome - Wikipedia](https://en.wikipedia.org/wiki/Palindrome)
- **Almost Palindrome**:
  Determines if a string can become a palindrome by removing at most one character. https://medium.com/@wendellrodrigues89/almost-palindrome-edd618041983
- **Anagrams**:
  Groups strings that are anagrams of each other. [Anagram - Wikipedia](https://en.wikipedia.org/wiki/Anagram)
- **Count Characters**:
  Counts occurrences of a specific character in a string. https://en.wikipedia.org/wiki/Character_counting
- **Matching Brackets:** 
  Determines if a string contains matching brackets. [Balanced Brackets | HackerRank](https://www.hackerrank.com/challenges/balanced-brackets/problem)
- **Making Brackets Match:** 
  Removes unmatched brackets from the string. [Remove Invalid Parentheses | GeeksforGeeks](https://www.geeksforgeeks.org/remove-invalid-parentheses/)
- **Max 3 Different letters:** 
  Determines if provided strings differ by at leaset 3 characters.
- **Longest Substring with Uniqe Characters:** 
  Detemines the longest substring that contains unique characters. https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
- **Hash-as-backspace-encoded String:** 
  Decodes the provided string encoded in a way that "#" acts as backspace, deleting the previous character, e.g. `"abc#" -> "ab"` https://leetcode.com/problems/backspace-string-compare/description/
- **Remove Duplicated Characters:** 
  Removes duplicate characters from the provided string. [Remove duplicates from a string | GeeksforGeeks](https://www.geeksforgeeks.org/remove-duplicates-from-a-given-string/)
- **Rotated String:** 
  Determines if a string is rotated, e.g. `"abcd"` and `"dabc"` are rotated. https://leetcode.com/problems/rotate-string/description/

### Numbers Operations

- **BinaryReverse**: 
  Reverses the binary representation of an integer. [Learn more about binary operations](https://en.wikipedia.org/wiki/Bitwise_operation)
- **Prime Number:** 
  Checks if a number is prime or not.
- **Missing numbers:** 
  Prints missing numbers from a provided range.

### Array Operations

- **BinarySearch**: 
  Implements binary search algorithm on a sorted array. [Learn more about binary search](https://en.wikipedia.org/wiki/Binary_search_algorithm)
- **BubbleSort**: 
  Implements bubble sort algorithm for array sorting. [Learn more about bubble sort](https://en.wikipedia.org/wiki/Bubble_sort)
- **QuickSort**: 
  Implements quicksort algorithm for array sorting. [Quick Sort | GeeksforGeeks](https://www.geeksforgeeks.org/quick-sort-algorithm/)
- **Indices of Two Values**: 
  Finds indices of two numbers that sum up to a target value. https://leetcode.com/problems/two-sum/
- **Largest Container:** 
  Finds indices of walls that form the largest possible container. https://leetcode.com/problems/container-with-most-water/description/
- **Rainwater:** 
  Calculates the amount of rainwater that can be trapped between walls in an array. https://leetcode.com/problems/trapping-rain-water/description/

### Linked Lists:

- **Detect Linked List Cycles:**
  Checks if the provided linked list in cyclical https://leetcode.com/problems/linked-list-cycle/

### Binary Tree Operations

- **BinaryTreeDepth**: 
  Calculates the maximum depth of a binary tree. [Learn more about tree depth](https://en.wikipedia.org/wiki/Tree_(data_structure)#Depth)
- **BinaryTreeRightNodes**: 
  Identifies the rightmost visible nodes in a binary tree. [Learn more about binary tree traversal](https://en.wikipedia.org/wiki/Tree_traversal)

###### Matrix Operations

- **CountingIslands**: 
  Counts the number of "islands" (connected 1s) in a binary matrix. [Learn more about island counting algorithms](https://en.wikipedia.org/wiki/Connected-component_labeling)
- **Keypad:** 
  Calculates how many moves one has to make to enter a PIN on a keypad with randomized digit positions.
- **Flood Fill**: 
  Implements flood-fill algorithm (popular in graphic software) that applies color to neighboring pixels of the same value https://leetcode.com/problems/flood-fill/description/
- **Walls and Gates:** 
  An algorithm finding the shortest path from "gate" to "gate" in a 2D matrix. https://leetcode.com/problems/walls-and-gates/description/
- **Rotting Oranges:** 
  An algorithm determining whether it's possible to rot all the oranges (and in how many moves). https://leetcode.com/problems/rotting-oranges/description/

### Others:

- **FindMedian**: 
  Calculates the median value of an array of integers. [Learn more about median calculations](https://en.wikipedia.org/wiki/Median)
- **Knight on a Chessboard:** 
  Calculate probability that a randomly moving knight will still be on a chessboard after certain number of moves. https://leetcode.com/problems/knight-probability-in-chessboard/description/
- **Monarchy / Succession Line:** 
  Print succession line in a provided family / monarchy, described by a provided genealogical tree. https://leetcode.com/problems/throne-inheritance/description/ 

## License

This project is licensed under the MIT License.
