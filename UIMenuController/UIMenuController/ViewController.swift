//
//  ViewController.swift
//  UIMenuController
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = ActionLabel()
        view.addSubview(label)
        label.text = "text"
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        label.addGestureRecognizer(gestureRecognizer)
    }

    @objc private func handleLongPressGesture(recognizer: UIGestureRecognizer) {
        guard recognizer.state == .recognized else {
            return
        }
        
        if let recognizerView = recognizer.view,
            let recognizerSuperView = recognizerView.superview {
            
            guard recognizerView.becomeFirstResponder() else {
                return
            }
            
            let menuController = UIMenuController.shared
            menuController.setTargetRect(recognizerView.frame, in: recognizerSuperView)
            menuController.setMenuVisible(true, animated: true)
        }
    }
    
}

