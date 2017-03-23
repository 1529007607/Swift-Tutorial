//
//  Views.swift
//  DrawSth
//
//  Created by Andrew Chai on 3/21/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class HeartView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 200, y: 150))
        path.addCurve(to: CGPoint(x: 200, y: 100), control1: CGPoint(x: 150, y: 120), control2: CGPoint(x: 180, y: 80))
        path.addCurve(to: CGPoint(x: 200, y: 150), control1: CGPoint(x: 220, y: 80), control2: CGPoint(x: 250, y: 120))
        path.closeSubpath()
        context.addPath(path)
        context.strokePath()
        context.restoreGState()
    }
}

func degree2radian(a: CGFloat) -> CGFloat {
    let b = CGFloat(M_PI) * a / 180
    return b
}

class WheelView: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        for i in 1...12 {
            context.saveGState()
            context.translateBy(x: 200, y: 200)
            context.rotate(by: degree2radian(a: 30 * CGFloat(i)))
            context.translateBy(x: -200, y: -200)
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 150, y: 200))
            path.closeSubpath()
            context.addPath(path)
            context.strokePath()
            context.restoreGState()
        }
        let circleBounds = CGRect(x: 150, y: 150, width: 100, height: 100)
        context.strokeEllipse(in: circleBounds)
    }
}

class GradientView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let locations: [CGFloat] = [0.0, 0.25, 0.5, 0.75]
        let colors = [UIColor.red.cgColor,
                      UIColor.green.cgColor,
                      UIColor.blue.cgColor,
                      UIColor.yellow.cgColor]
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorspace, colors: colors as CFArray, locations: locations)
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        startPoint.x = 0.0
        startPoint.y = 0.0
        endPoint.x = 600
        endPoint.y = 600
        
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
    }
}

class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(rect)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: 200, y: 0))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 100))
        //        path.addLine(to: CGPoint(x: 100, y: 0))
        //        path.addQuadCurve(to: CGPoint(x: 0, y: 100), control: CGPoint(x: 20, y: 50), transform: CGAffineTransform.identity)
        path.closeSubpath()
        context?.addPath(path)
        //        context?.strokePath()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setFillColor(UIColor.red.cgColor)
        context?.drawPath(using: .eoFillStroke)
        //        context?.fillPath(using: .evenOdd)
    }
}
