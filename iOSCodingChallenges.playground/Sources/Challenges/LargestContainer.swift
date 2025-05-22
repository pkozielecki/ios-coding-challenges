import Foundation

public struct LargestContainer: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        let data = largestContainer
        return "Largest container: \(data.0), between \(data.1) and \(data.2)"
    }
}

extension LargestContainer {

    fileprivate var largestContainer: (Int, Int, Int) {
        guard data.count > 1 else {
            return (0,0,0)
        }

        var biggestArea = 0
        var biggestP1 = 0
        var biggestP2 = 0
        var p1 = 0
        var p2 = data.count-1
        
        while p1<p2 {
            let area = area(p1: p1, p2:p2)
            //  If calculated area > current, record data.
            if area > biggestArea {
                biggestArea = area
                biggestP1 = p1
                biggestP2 = p2
            }
            
            //  Smallest of walls affets the area -> move it to the center, looking for taller wall.
            if data[p1] < data[p2] {
                p1 += 1
            } else {
                p2 -= 1
            }
        }
        
        
        return (biggestArea, biggestP1, biggestP2)
    }
    
    func area(p1: Int, p2: Int) -> Int {
        // Area the water can fill = smallest of edges x distance between them
        min(data[p1], data[p2]) * (p2-p1)
    }
}
