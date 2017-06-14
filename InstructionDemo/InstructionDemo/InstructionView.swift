//
//  InstructionView.swift
//  InstructionDemo
//
//  Created by Andrew Chai on 6/2/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class InstructionView: UIView {
    
    var transparentRect: CGRect
    var text: NSString
    
    let positions: [CGRect] = [
        CGRect(x: 15, y: 20, width: 40, height: 40),
        CGRect(x: 65, y: 20, width: 40, height: 40),
        CGRect(x: 115, y: 20, width: 40, height: 40),
        CGRect(x: 920, y: 20, width: 40, height: 40),
        CGRect(x: 970, y: 20, width: 40, height: 40)
    ]
    
    let texts: [NSString] = [
        NSString(string: "test0"),
        NSString(string: "test1"),
        NSString(string: "test2"),
        NSString(string: "test3"),
        NSString(string: "test4")
    ]
    
    override init(frame: CGRect) {
        transparentRect = positions.first!
        text = texts.first!
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isOpaque = false
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InstructionView.turnToNext)))
    }
    
    @objc private func turnToNext() {
        if let index = positions.index(of: transparentRect),
            index < positions.count - 1 {
            transparentRect = positions[index + 1]
            text = texts[index + 1]
        }
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            let path = CGMutablePath()
            path.addRect(rect)
            path.addEllipse(in: transparentRect)
            context.setFillColor(UIColor(red: 230/250.0, green: 230/250.0, blue: 230/250.0, alpha: 1.0).cgColor)
            context.setAlpha(0.8)
            context.addPath(path)
            context.drawPath(using: .eoFill)
            
            context.setAlpha(1.0)
            let offset = UIOffset(horizontal: 0, vertical: 10)
            let textFontAttributes = [
                NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14),
                NSForegroundColorAttributeName: UIColor.red,
            ]
            text.draw(at: CGPoint(x: transparentRect.origin.x, y: transparentRect.maxY + offset.vertical), withAttributes: textFontAttributes)
        }
    }
}
