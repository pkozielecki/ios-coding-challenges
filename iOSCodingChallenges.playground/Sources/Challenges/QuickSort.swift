import Foundation

public struct QuickSort: Challenge {
    public let data: [Int]

    public init(data: [Int]) {
        self.data = data
    }

    public func execute() -> String {
        return "Sorted: \(sorted)"
    }
}

extension QuickSort {

    fileprivate var sorted: [Int] {
        var array = data
        quickSort(array: &array, left: 0, right: data.count - 1)
        return array
    }
    
    func quickSort(array: inout [Int], left: Int, right: Int) {
        guard left < right else { return }  // 1el array
        
        var partitionIndex = left   //  index to divide array with
        let pivot = array[right]    //  pivot - value to position permamently.
        for index in left...right-1 {
            if array[index] < pivot {   // value at index is smaller than pivot...
                swap(array: &array, left: partitionIndex, right: index) // ... swap with partition index
                partitionIndex += 1     // move partition index closer to pivot
            }
        }
        swap(array: &array, left: partitionIndex, right: right) // put pivot at it resting place
        
        // Divide & conquer - split array and apply recursion to each halves.
        // Repeat until sorted.
        quickSort(array: &array, left: left, right: partitionIndex-1)
        quickSort(array: &array, left: partitionIndex+1, right: right)
    }
    
    func swap(array: inout [Int], left: Int, right: Int) {
        let temp = array[left]
        array[left] = array[right]
        array[right] = temp
    }
}
