//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
view.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = view

let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 8, height: 8))
let maskLayer = CAShapeLayer()
maskLayer.path = path.cgPath
view.layer.mask = maskLayer

