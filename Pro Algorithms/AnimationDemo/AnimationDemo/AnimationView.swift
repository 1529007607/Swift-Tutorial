//
//  AnimationView.swift
//  AnimationDemo
//
//  Created by Andrew Chai on 6/3/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class AnimationView: UIView {
    var backgroundImage: UIImageView?
    var overlayView: UIView?
    
    func setupBackgroundImage() {
        let bi = UIImageView(image: #imageLiteral(resourceName: "netWorkingLoading"))
        bi.contentMode = .scaleAspectFit
        bi.isUserInteractionEnabled = true
        bi.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bi)
        bi.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bi.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bi.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bi.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImage = bi
    }
    
    var constraint: NSLayoutConstraint?
    
    func setupOverlayView() {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        overlayView = view
        self.backgroundImage?.addSubview(view)
        self.setupOverlayViewConstraints()
        setupGestureRecognizer()
    }
    
    var timer: Timer?
    
    func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AnimationView.startAnimation))
        self.overlayView?.addGestureRecognizer(tap)
    }
    
    var offset: CGFloat = 0.0
    
    func removeOverlayView() {
        overlayView?.removeFromSuperview()
    }
    
    func updateOverlayViewConstraints() {
        let constant = offset.truncatingRemainder(dividingBy: bounds.width)
        guard constant < bounds.width - 10 else {
            return removeOverlayView()
        }
        
        offset += bounds.width / 100
        constraint?.constant = offset.truncatingRemainder(dividingBy: bounds.width)
    }
    
    func setupOverlayViewConstraints() {
        if let overlayView = overlayView,
            let bgImage = backgroundImage {
            overlayView.topAnchor.constraint(equalTo: bgImage.topAnchor).isActive = true
            overlayView.bottomAnchor.constraint(equalTo: bgImage.bottomAnchor).isActive = true
            constraint = overlayView.leftAnchor.constraint(equalTo: bgImage.leftAnchor)
            overlayView.rightAnchor.constraint(equalTo: bgImage.rightAnchor).isActive = true
            constraint?.isActive = true
        }
    }
    
    func startAnimation() {
        if let timer = timer {
            timer.fireDate = .distantPast
            timer.fire()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t) in
                self.updateOverlayViewConstraints()
            })
            timer?.fire()
        }
    }
    
    func stopAnimation() {
        timer?.fireDate = .distantFuture
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundImage()
        setupOverlayView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
