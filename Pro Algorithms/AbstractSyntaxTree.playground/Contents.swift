//: Playground - noun: a place where people can play

import UIKit

// Node that represents a value or operator in Abstract Syntax Tree
class Node {
    var operation: String?
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func evaluate(node: Node) -> Float {
    if node.value != nil {
        return node.value!
    }
    
    if node.operation == "+" {
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    } else if node.operation == "*" {
        return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
    } else if node.operation == "-" {
        return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
    } else if node.operation == "/" {
        // Bewear of right value be 0
        return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
    }
    
    return 0
}

let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)
let twentyFiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)

let mult25_6Node = Node(operation: "*", value: nil, leftChild: sixNode, rightChild: twentyFiveNode)
let rootPlusNode = Node(operation: "+", value: nil, leftChild: mult25_6Node, rightChild: fiveNode)

evaluate(node: rootPlusNode)