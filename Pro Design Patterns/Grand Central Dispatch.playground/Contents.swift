//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

print("1")
let queue = DispatchQueue(label: "workQueue", attributes: .concurrent)
let group = DispatchGroup()
queue.async(group: group, qos: .utility, flags: .noQoS) { 
    print("ok")
}
print("2")
group.wait(timeout: .distantFuture)

PlaygroundPage.current.needsIndefiniteExecution = true


