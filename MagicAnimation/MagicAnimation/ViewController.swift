//
//  ViewController.swift
//  MagicAnimation
//
//  Created by Andrew Chai on 2/24/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topView: UIView!
    var middleView: UIView!
    var bottomView: UIView!
    var firstView: UIView!
    var secondView: UIView!
    var thirdView: UIView!
    
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
    
    var viewArr: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        topView = UIView(frame: topFrame)
        middleView = UIView(frame: middleFrame)
        bottomView = UIView(frame: bottomFrame)
        
        firstView = UIView(frame: view.bounds)
        secondView = UIView(frame: view.bounds)
        thirdView = UIView(frame: view.bounds)
        
        firstView.addSubview(topView)
        secondView.addSubview(middleView)
        thirdView.addSubview(bottomView)
        
        view.addSubview(firstView)
        view.insertSubview(secondView, belowSubview: firstView)
        view.insertSubview(thirdView, belowSubview: secondView)
        
        topView.backgroundColor = topColor
        middleView.backgroundColor = middleColor
        bottomView.backgroundColor = bottomColor
        
        swipeGR = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gestureRecognizer:)))
        swipeGR.direction = .left
        firstView.addGestureRecognizer(swipeGR)
        
    }

    func handleSwipe(gestureRecognizer: UISwipeGestureRecognizer) {
        guard gestureRecognizer.direction == .left else {
            return
        }
        
        
        if gestureRecognizer.view == firstView {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.firstView.frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.firstView.frame = frame
                            self.middleView.frame = self.topFrame
                            self.bottomView.frame = self.middleFrame
                            
                            self.middleView.backgroundColor = self.topColor
                            self.bottomView.backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.firstView.removeGestureRecognizer(self.swipeGR)
                            self.secondView.addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.firstView)
                            self.firstView.frame = self.view.bounds
                            self.topView.frame = self.bottomFrame
                            self.topView.backgroundColor = self.bottomColor
            })
        }
        
        if gestureRecognizer.view == secondView {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.secondView.frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.secondView.frame = frame
                            self.bottomView.frame = self.topFrame
                            self.topView.frame = self.middleFrame
                            
                            self.bottomView.backgroundColor = self.topColor
                            self.topView.backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.secondView.removeGestureRecognizer(self.swipeGR)
                            self.thirdView.addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.secondView)
                            self.secondView.frame = self.view.bounds
                            self.middleView.frame = self.bottomFrame
                            self.middleView.backgroundColor = self.bottomColor
            })
        }
        
        if gestureRecognizer.view == thirdView {
            UIView.animate(withDuration: 0.5,
                           animations: {
                            let frame = self.thirdView.frame.offsetBy(dx: -self.view.bounds.width, dy: 0)
                            self.thirdView.frame = frame
                            self.topView.frame = self.topFrame
                            self.middleView.frame = self.middleFrame
                            
                            self.topView.backgroundColor = self.topColor
                            self.middleView.backgroundColor = self.middleColor
            },
                           completion: { (finished) in
                            self.thirdView.removeGestureRecognizer(self.swipeGR)
                            self.firstView.addGestureRecognizer(self.swipeGR)
                            
                            self.view.sendSubview(toBack: self.thirdView)
                            self.thirdView.frame = self.view.bounds
                            self.bottomView.frame = self.bottomFrame
                            self.bottomView.backgroundColor = self.bottomColor
            })
        }
        
    }
    
}

