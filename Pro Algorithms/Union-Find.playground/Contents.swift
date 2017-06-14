//: Playground - noun: a place where people can play

public struct UnionFind<T: Hashable> {
    private var index = [T: Int]()
    private var parent = [Int]()
    private var size = [Int]()
    
    public mutating func addSet(with element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }
    
    public mutating func set(of element: T) -> Int? {
        if let indexOfElement = index[element] {
            return set(by: indexOfElement)
        } else {
            return nil
        }
    }
    
    private mutating func set(by index: Int) -> Int {
        if parent[index] == index {
            return index
        } else {
            parent[index] = set(by: parent[index])
            return parent[index]
        }
    }
}

