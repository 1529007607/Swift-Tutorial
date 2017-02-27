//
//  ViewController.swift
//  MagicAnimation
//
//  Created by Andrew Chai on 2/24/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let margin: CGFloat = 80
    
    var width: CGFloat {
        return UIScreen.main.bounds.width - margin * 2
    }
    
    var height: CGFloat {
        return UIScreen.main.bounds.height - margin * 2
    }
    
    let xOffsetm: CGFloat = 40
    let yOffsetm: CGFloat = 40
    
    var xOffsetb: CGFloat {
        return xOffsetm + 20
    }
    
    var yOffsetb: CGFloat {
        return yOffsetm + 20
    }
    
    var heightm: CGFloat {
        return height - yOffsetm * 2
    }
    
    var heightb: CGFloat {
        return height - yOffsetb * 2
    }
    
    var topFrame: CGRect {
        return CGRect(x: margin, y: margin, width: width, height: height)
    }
    
    var middleFrame: CGRect {
        return CGRect(x: margin + xOffsetm, y: margin + yOffsetm, width: width, height: heightm)
    }
    
    var bottomFrame: CGRect {
        return CGRect(x: margin + xOffsetb, y: margin + yOffsetb, width: width, height: heightb)
    }
    
    var topColor: UIColor {
        return UIColor.white
    }
    
    var middleColor: UIColor {
        return UIColor.lightGray
    }
    
    var bottomColor: UIColor {
        return UIColor.gray
    }
    
    var swipeLeft: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!
    
    var viewList: CircleDoublyLinkedList = CircleDoublyLinkedList<UIView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        let firstView = UIView(frame: topFrame)
        let secondView = UIView(frame: middleFrame)
        let thirdView = UIView(frame: bottomFrame)
        
        viewList.append(value: firstView)
        viewList.append(value: secondView)
        viewList.append(value: thirdView)
        
        view.addSubview(firstView)
        view.insertSubview(secondView, belowSubview: firstView)
        view.insertSubview(thirdView, belowSubview: secondView)
        
        firstView.backgroundColor = topColor
        secondView.backgroundColor = middleColor
        thirdView.backgroundColor = bottomColor
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gestureRecognizer:)))
        swipeLeft.direction = [.left]
        firstView.addGestureRecognizer(swipeLeft)
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gestureRecognizer:)))
        swipeRight.direction = [.right]
        firstView.addGestureRecognizer(swipeRight)
    }
    
    private func handleSwipeLeft(gestureRecognizer: UISwipeGestureRecognizer) {
        if let currentNode = viewList.start,
            let previousNode = currentNode.previous,
            let nextNode = currentNode.next,
            gestureRecognizer.view == currentNode.value {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = currentNode.value.frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            currentNode.value.frame = frame
                            nextNode.value.frame = self.topFrame
                            previousNode.value.frame = self.middleFrame
                            
                            nextNode.value.backgroundColor = self.topColor
                            previousNode.value.backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            currentNode.value.removeGestureRecognizer(self.swipeLeft)
                            nextNode.value.addGestureRecognizer(self.swipeLeft)
                            currentNode.value.removeGestureRecognizer(self.swipeRight)
                            nextNode.value.addGestureRecognizer(self.swipeRight)
                            
                            self.view.sendSubview(toBack: currentNode.value)
                            currentNode.value.frame = self.bottomFrame
                            currentNode.value.backgroundColor = self.bottomColor
                            self.viewList.start = currentNode.next
            })
        }
    }
    
    private func handleSwipeRight(gestureRecognizer: UISwipeGestureRecognizer) {
        if let currentNode = viewList.start,
            let previousNode = currentNode.previous,
            let nextNode = currentNode.next,
            gestureRecognizer.view == currentNode.value {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = previousNode.value.frame.offsetBy(dx: self.view.bounds.width, dy: 0)
                            previousNode.value.frame = frame
                            nextNode.value.frame = self.bottomFrame
                            currentNode.value.frame = self.middleFrame
                            
                            nextNode.value.backgroundColor = self.bottomColor
                            currentNode.value.backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            currentNode.value.removeGestureRecognizer(self.swipeRight)
                            previousNode.value.addGestureRecognizer(self.swipeRight)
                            currentNode.value.removeGestureRecognizer(self.swipeLeft)
                            previousNode.value.addGestureRecognizer(self.swipeLeft)
                            
                            self.view.bringSubview(toFront: previousNode.value)
                            previousNode.value.frame = self.topFrame
                            previousNode.value.backgroundColor = self.topColor
                            self.viewList.start = currentNode.previous
            })
        }
    }
    
    func handleSwipe(gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction {
        case UISwipeGestureRecognizerDirection.left:
            handleSwipeLeft(gestureRecognizer: gestureRecognizer)
            break
        case UISwipeGestureRecognizerDirection.right:
            handleSwipeRight(gestureRecognizer: gestureRecognizer)
            break
        default:
            break
        }
    }
    
}

