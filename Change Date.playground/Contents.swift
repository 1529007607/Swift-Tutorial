//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class Controller: UIViewController {

    @objc func previousBtClicked(sender: UIButton) {
        print("ok")
    }
    
    @objc func text(ges: UITapGestureRecognizer) {
        print("ok")
    }
    
    override func viewDidLoad() {
        let bgview = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.addSubview(bgview)
        bgview.backgroundColor = UIColor.lightGray
        bgview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(text(ges:))))

        let previousBt = UIButton(type: UIButtonType.roundedRect)
        bgview.addSubview(previousBt)
        previousBt.setTitle("<", for: .normal)
        previousBt.addTarget(self, action: #selector(previousBtClicked(sender:)), for: .touchUpInside)
        previousBt.translatesAutoresizingMaskIntoConstraints = false
        previousBt.centerXAnchor.constraint(equalTo: bgview.centerXAnchor, constant: -50).isActive = true
        previousBt.centerYAnchor.constraint(equalTo: bgview.centerYAnchor).isActive = true
        
        let nextBt = UIButton(type: .roundedRect)
        bgview.addSubview(nextBt)
        nextBt.setTitle(">", for: .normal)
        nextBt.translatesAutoresizingMaskIntoConstraints = false
        nextBt.centerXAnchor.constraint(equalTo: bgview.centerXAnchor, constant: 50).isActive = true
        nextBt.centerYAnchor.constraint(equalTo: bgview.centerYAnchor).isActive = true
    }
}


PlaygroundPage.current.liveView = Controller().view
