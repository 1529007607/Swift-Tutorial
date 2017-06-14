//: Playground - noun: a place where people can play

func countOccurencesOfKey(_ key: Int, in array: [Int]) -> Int {
    let leftBoundary = { () -> Int in
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low) / 2
            if array[midIndex] < key {
                low = midIndex + 1
            } else {
                high = midIndex
            }
        }
        return low
    }
    
    let rightBoundary = { () -> Int in
        var low = 0
        var high = array.count
        while low < high {
            let midIndex = low + (high - low) / 2
            if array[midIndex] > key {
                high = midIndex
            } else {
                low = midIndex + 1
            }
        }
        return low
    }
    
    return rightBoundary() - leftBoundary()
}

let a = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]

countOccurencesOfKey(3, in: a)  // returns 4