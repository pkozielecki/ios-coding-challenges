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
]

for challenge in challanges {
    print("&&&&&&&&&& \(challenge.name)")
    print("----- DATA: \(challenge.data)")
    print("----- RESULT: \(challenge.execute())")
    print("--------------------------------------")
}
