//: Playground - noun: a place where people can play

/// Perfomance: O(1)~O(n)
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

let array = [5, 2, 4, 7]
linearSearch(array, 2)