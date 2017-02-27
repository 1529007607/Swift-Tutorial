//
//  CircleDoublyLinkedList.swift
//  MagicAnimation
//
//  Created by Andrew Chai on 2/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class CircleDoublyLinkedList<T> {
    var start: Node<T>?
    var end: Node<T>?
    var count = 0
    
    func isEmpty() -> Bool {
        return start == nil
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        
        if start == nil {
            newNode.next = newNode
            newNode.previous = newNode
            start = newNode
            end = start
        } else {
            newNode.previous = end
            end?.next = newNode
            start?.previous = newNode
            newNode.next = start
            end = newNode
        }
        
        count += 1
    }
}
