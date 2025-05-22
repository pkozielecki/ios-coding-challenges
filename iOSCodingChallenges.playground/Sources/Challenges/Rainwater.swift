import Foundation

public struct Rainwater: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        "Collected rainwater: \(rainwaterOptimised), brute force: \(rainwaterBruteForce)"
    }
}

extension Rainwater {
    
    var rainwaterBruteForce: Int {
        guard data.count > 2 else { return 0 }
        
        var water = 0
        for i in 1...data.count-2 {
            //  Split the array at the index, get tallest wall on each side & calculate valume above the bar:
            let maxL = data[0...i-1].sorted(by: {$0>$1}).first ?? 0
            let maxR = data[i-1...data.count-1].sorted(by: {$0>$1}).first ?? 0
            water += waterAbove(index: i, maxL: maxL, maxR: maxR)
        }
        
        return water
    }

    var rainwaterOptimised: Int {
        guard data.count > 2 else { return 0 }
        
        var left = 0
        var right = data.count-1
        var maxL = data[left]
        var maxR = data[right]
        var rainwater = 0
        
        while left < right {
            let valL = data[left]
            let valR = data[right]
            
            //  Smaller wall always counts most
            if valL < valR {
                //  Current value is taller than the left wall:
                if valL > maxL {
                    //  ... make it a new wall
                    maxL = valL
                } else {
                    //  ... or just count water above the bar:
                    rainwater += waterAbove(index: left, maxL: maxL, maxR: maxR)
                }
                left += 1
            } else {
                if valR > maxR {
                    maxR = valR
                } else {
                    rainwater += waterAbove(index: right, maxL: maxL, maxR: maxR)
                }
                right -= 1
            }
        }
        
        return rainwater
    }
    
    func waterAbove(index: Int, maxL: Int, maxR: Int) -> Int {
        // Volume of water above the bar will be wqual to lowest wall (maxL, maxR) - height of the bar:
        return max(0, min(maxL, maxR) - data[index])
    }
}
