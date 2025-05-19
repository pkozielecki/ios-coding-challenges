import Foundation

public struct SuccessionLine: Challenge {
    public typealias T = Monarchy

    public let data: Monarchy

    public init(data: Monarchy) {
        self.data = data
    }

    public func execute() -> String {
        return "Succession line: \(data.printSuccession())"
    }
}

extension SuccessionLine {
    
    public class Person {
        public let name: String
        private(set) public var children: [Person] = []
        private(set) public var isAlive: Bool = true

        public init(name: String) {
            self.name = name
        }
        
        public func add(child: Person) {
            children.append(child)
        }
        
        public func kill() {
            isAlive = false
        }
    }
    
    public class Monarchy: CustomStringConvertible {
        public let king: Person
        private var people: [Person] = []
        
        /// Initiates succession line:
        public init(kingName: String) {
            self.king = Person(name: kingName)
            people.append(king)
        }
        
        /// Adds new person to the succession list.
        /// Order of succession is dependent on the Parent.
        public func birth(childName: String, parentName: String) {
            guard let parent = people.filter({ $0.name == parentName }).first else {
                return
            }
            let child = Person(name: childName)
            parent.add(child: child)
            people.append(child)
        }
        
        /// Marks person as dead, removing it from the succession line (but not from the monarchy).
        public func death(name: String) {
            guard let person = people.filter({ $0.name == name }).first else {
                return
            }
            person.kill()
        }
        
        public func printSuccession() -> String {
            var list = [String]()
            listSucceedingPeople(head: king, successionList: &list)
            return list.joined(separator: ", ")
        }
        
        private func listSucceedingPeople(head: Person, successionList: inout [String]) {
            if head.isAlive {
                successionList.append(head.name)
            }
            for child in head.children {
                listSucceedingPeople(head: child, successionList: &successionList)
            }
        }
        
        public var description: String {
            return "King: \(king.name), people: \(people.count) (\(people.filter({$0.isAlive}).count) alive)"
        }
    }
}
