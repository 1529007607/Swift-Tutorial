//: Playground - noun: a place where people can play

/// Perfomence: O(log n)
/// Precondition: the array must be sorted.
/// Recursive implementation
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array
        return nil
    } else {
        // Calculate where to split the array
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound..<midIndex)
        }
        
        // Is the search key in the right half?
        else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
        }
        
        // If we get here, then we've found the search key!
        else {
            return midIndex
        }
    }
}
