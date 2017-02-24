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
    
    var swipeGR: UISwipeGestureRecognizer!
    
    var viewArr: [UIView] = [] // Using a two-way linked list to save tons of code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        let firstView = UIView(frame: topFrame)
        let secondView = UIView(frame: middleFrame)
        let thirdView = UIView(frame: bottomFrame)
        
        viewArr.append(firstView)
        viewArr.append(secondView)
        viewArr.append(thirdView)
        
        view.addSubview(viewArr[0])
        view.insertSubview(viewArr[1], belowSubview: viewArr[0])
        view.insertSubview(viewArr[2], belowSubview: viewArr[1])
        
        viewArr[0].backgroundColor = topColor
        viewArr[1].backgroundColor = middleColor
        viewArr[2].backgroundColor = bottomColor
        
        swipeGR = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gestureRecognizer:)))
        swipeGR.direction = [.left, .right]
        viewArr[0].addGestureRecognizer(swipeGR)
        
    }
    
    private func handleSwipeLeft(gestureRecognizer: UISwipeGestureRecognizer) {
        if gestureRecognizer.view == viewArr[0] {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.viewArr[0].frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.viewArr[0].frame = frame
                            self.viewArr[1].frame = self.topFrame
                            self.viewArr[2].frame = self.middleFrame
                            
                            self.viewArr[1].backgroundColor = self.topColor
                            self.viewArr[2].backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.viewArr[0].removeGestureRecognizer(self.swipeGR)
                            self.viewArr[1].addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.viewArr[0])
                            self.viewArr[0].frame = self.view.bounds
                            self.viewArr[0].frame = self.bottomFrame
                            self.viewArr[0].backgroundColor = self.bottomColor
            })
        }
        
        if gestureRecognizer.view == viewArr[1] {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.viewArr[1].frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.viewArr[1].frame = frame
                            self.viewArr[2].frame = self.topFrame
                            self.viewArr[0].frame = self.middleFrame
                            
                            self.viewArr[2].backgroundColor = self.topColor
                            self.viewArr[0].backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.viewArr[1].removeGestureRecognizer(self.swipeGR)
                            self.viewArr[2].addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.viewArr[1])
                            self.viewArr[1].frame = self.view.bounds
                            self.viewArr[1].frame = self.bottomFrame
                            self.viewArr[1].backgroundColor = self.bottomColor
            })
        }
        
        if gestureRecognizer.view == viewArr[2] {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.viewArr[2].frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.viewArr[2].frame = frame
                            self.viewArr[0].frame = self.topFrame
                            self.viewArr[1].frame = self.middleFrame
                            
                            self.viewArr[0].backgroundColor = self.topColor
                            self.viewArr[1].backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.viewArr[2].removeGestureRecognizer(self.swipeGR)
                            self.viewArr[0].addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.viewArr[2])
                            self.viewArr[2].frame = self.view.bounds
                            self.viewArr[2].frame = self.bottomFrame
                            self.viewArr[2].backgroundColor = self.bottomColor
            })
        }

    }
    
    private func handleSwipeRight(gestureRecognizer: UISwipeGestureRecognizer) {
        
    }
    
    func handleSwipe(gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction.rawValue {
        case UISwipeGestureRecognizerDirection.left.rawValue:
            handleSwipeLeft(gestureRecognizer: gestureRecognizer)
            break
        case UISwipeGestureRecognizerDirection.right.rawValue:
            handleSwipeRight(gestureRecognizer: gestureRecognizer)
            break
        default:
            break
        }
        
        
    }
    
}

