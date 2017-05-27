//: Playground - noun: a place where people can play

import Foundation

protocol MyProtocol {
    func dispatch(_ handle: Handler)
}

class FirstClass: MyProtocol {
    func dispatch(_ handle: Handler) {
        handle.handle(self)
    }
}

class SecondClass: MyProtocol {
    func dispatch(_ handle: Handler) {
        handle.handle(self)
    }
}

class Handler {
    func handle(_ protocol: MyProtocol) {
        print("Protocol")
    }
    
    func handle(_ protocol: FirstClass) {
        print("First Class")
    }
    
    func handle(_ protocol: SecondClass) {
        print("Second Class")
    }
}

let objects: [MyProtocol] = [FirstClass(), SecondClass()]
let handler = Handler()

for object in objects {
    object.dispatch(handler)
}