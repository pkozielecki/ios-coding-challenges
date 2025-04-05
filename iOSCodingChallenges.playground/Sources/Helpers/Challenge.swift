public protocol Challenge {
    associatedtype T: CustomStringConvertible
    
    var name: String { get }
    var data: T {get}
    
    func execute() -> String
}

public extension Challenge {
    var name: String { String(describing: type(of: self)) }
}
